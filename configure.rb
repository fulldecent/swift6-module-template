#!/usr/bin/ruby
require 'fileutils'
require 'date'

def prompt_for_variable(variable, default)
  return ARGV[0] if variable == '__PROJECT_NAME__' && ARGV.count == 1
  puts "Please enter a value for #{variable} (default: \"#{default}\")"
  answer = STDIN.gets.chomp
  answer.length > 0 ? answer : default
end

def replace_variables_in_files(substitutions)
  Dir.glob("**/*", File::FNM_DOTMATCH) do |file_name|
    next if File.directory?(file_name)

    text = ''
    File.open(file_name, 'rb') do |file|
      text = file.read
      substitutions.each do |old, new|
        text.gsub!(old, new)
      end
    end
    File.open(file_name, 'wb') do |file|
      file.write(text)
    end
  end
end

def replace_variables_in_file_names(substitutions)
  Dir.foreach('.') do |file_name|
    next if file_name == '.' or file_name == '..'
    new_file_name = file_name.clone
    substitutions.each do |old, new|
      new_file_name.gsub!(old, new)
    end
    if new_file_name != file_name
      FileUtils.mv file_name, new_file_name
    end
    if File.directory?(new_file_name)
      Dir.chdir(new_file_name) do
        replace_variables_in_file_names(substitutions)
      end
    end
  end
end

module Env
  class << self
    ENV_VARIABLE_PREFIX = 'SMT'

    def fetch_smt(template_var_name, *args, &b)
      environment_var_name = name_for(template_var_name.to_s)
      ENV.fetch(environment_var_name) do
        fallback(environment_var_name, template_var_name, *args, &b)
      end
    end

    def date_format_string
      @date_format_string ||=
        fetch_smt(:DATE_FORMAT_STRING, '%b %-d, %Y')
    end

    def name_for(template_var_name)
      "#{ ENV_VARIABLE_PREFIX }_#{ sanitize(template_var_name) }"
    end

    private

    def fallback(environment_var_name, template_var_name, *args)
      if block_given?
        yield(template_var_name, *args)
      else
        ENV.fetch(environment_var_name, *args)
      end
    end

    def sanitize(template_var_name)
      template_var_name.upcase.gsub(/\W/, '_').gsub(/^_+|_+$/, '')
    end
  end
end

##
## MAIN
##

substitutions = {
  'xxPROJECTxNAMExx' => 'MyProject',
  '__ORGANIZATION NAME__' => 'Awesome Org',
  'com.AN.ORGANIZATION.IDENTIFIER' => 'com.awesome',
  '__AUTHOR NAME__' => 'Mr McAwesome',
  '__TODAYS_DATE__' => Date.today.strftime(Env.date_format_string),
  '__TODAYS_YEAR__' => "#{Date.today.year}",
  '__GITHUB_USERNAME__' => 'awesome_octocat'
}
substitutions.each do |variable, default|
  substitutions[variable] =
    Env.fetch_smt(variable, default, &method(:prompt_for_variable))
end
# substitutions['--PROJECT-NAME--'] = substitutions['__PROJECT_NAME__']

Dir.chdir File.dirname(__FILE__)
FileUtils.mkdir_p 'OUTPUT'
FileUtils.cp_r 'xxPROJECTxNAMExx', 'OUTPUT/'
Dir.chdir 'OUTPUT/'

replace_variables_in_files(substitutions)
replace_variables_in_file_names(substitutions)

puts "DONE, your project is now ready to use in the OUTPUT/ folder"
