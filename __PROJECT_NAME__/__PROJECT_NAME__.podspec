Pod::Spec.new do |s|
  s.name = '__PROJECT_NAME__'
  s.version = '0.1.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'A short description of __PROJECT_NAME__.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/__GITHUB_USERNAME__/__PROJECT_NAME__'
  s.authors = { 'PROJECT_OWNER' => 'USER_EMAIL' }
  s.source = { :git => 'https://github.com/__GITHUB_USERNAME__/__PROJECT_NAME__.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.{h,m,swift}'
  s.resource_bundles = {
    '__PROJECT_NAME__' => ['Resources/**/*.{png}']
  }
end