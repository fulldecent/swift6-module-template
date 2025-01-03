#!/usr/bin/env swift

import Foundation

func promptForVariable(variable: String, defaultValue: String) -> String {
  if variable == "__PROJECT_NAME__", CommandLine.arguments.count == 2 {
    return CommandLine.arguments[1]
  }
  print("Please enter a value for \(variable) (default: \"\(defaultValue)\")")
  if let answer = readLine(), !answer.isEmpty {
    return answer
  }
  return defaultValue
}

func replaceVariablesInFiles(substitutions: [(from: String, to: String)]) {
  let fileManager = FileManager.default
  let enumerator = fileManager.enumerator(atPath: ".")
  
  while let fileName = enumerator?.nextObject() as? String {
    var isDirectory: ObjCBool = false
    if fileManager.fileExists(atPath: fileName, isDirectory: &isDirectory), !isDirectory.boolValue {
      do {
        var text = try String(contentsOfFile: fileName, encoding: .utf8)
        for substitution in substitutions {
          text = text.replacingOccurrences(of: substitution.from, with: substitution.to)
        }
        try text.write(toFile: fileName, atomically: true, encoding: .utf8)
      } catch {
        // Skip this file if it isn’t valid UTF-8
      }
    }
  }
}

func replaceVariablesInFileNames(substitutions: [(from: String, to: String)]) {
  let fileManager = FileManager.default
  let contents = try! fileManager.contentsOfDirectory(atPath: ".")

  for fileName in contents {
    if fileName == "." || fileName == ".." {
      continue
    }
    var newFileName = fileName
    for substitution in substitutions {
      newFileName = newFileName.replacingOccurrences(of: substitution.from, with: substitution.to)
    }
    if newFileName != fileName {
      try! fileManager.moveItem(atPath: fileName, toPath: newFileName)
    }
    var isDirectory: ObjCBool = false
    if fileManager.fileExists(atPath: newFileName, isDirectory: &isDirectory), isDirectory.boolValue {
      fileManager.changeCurrentDirectoryPath(newFileName)
      replaceVariablesInFileNames(substitutions: substitutions)
      fileManager.changeCurrentDirectoryPath("..")
    }
  }
}

struct Env {
  static let ENV_VARIABLE_PREFIX = "SMT"
  
  static func fetchSMT(templateVarName: String, defaultValue: String, prompt: (String, String) -> String) -> String {
    let environmentVarName = nameFor(templateVarName: templateVarName)
    if let value = ProcessInfo.processInfo.environment[environmentVarName] {
      return value
    }
    return prompt(templateVarName, defaultValue)
  }
  
  static func nameFor(templateVarName: String) -> String {
    return "\(ENV_VARIABLE_PREFIX)_\(sanitize(templateVarName: templateVarName))"
  }
  
  private static func sanitize(templateVarName: String) -> String {
    return templateVarName
      .uppercased()
      .replacingOccurrences(of: "\\W", with: "_", options: .regularExpression)
      .trimmingCharacters(in: CharacterSet(charactersIn: "_"))
  }
}

let yearFormatter = DateFormatter()
yearFormatter.dateFormat = "yyyy"

var substitutionPairs: [(from: String, to: String)] = [
  (from: "xxPROJECTxNAMExx", to: "MyProject"),
  (from: "__ORGANIZATION NAME__", to: "Awesome Org"),
  (from: "com.AN.ORGANIZATION.IDENTIFIER", to: "com.awesome"),
  (from: "__AUTHOR NAME__", to: "Mr McAwesome"),
  (from: "__TODAYS_DATE__", to: DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)),
  (from: "__TODAYS_YEAR__", to: yearFormatter.string(from: Date())),
  (from: "__GITHUB_USERNAME__", to: "awesome_octocat")
]

// Update the values through environment variables or prompts
substitutionPairs = substitutionPairs.map { pair in
  (from: pair.from, to: Env.fetchSMT(templateVarName: pair.from, defaultValue: pair.to, prompt: promptForVariable))
}

let fileManager = FileManager.default
fileManager.changeCurrentDirectoryPath(fileManager.currentDirectoryPath)

// Create OUTPUT folder and copy your template folder
try! fileManager.createDirectory(atPath: "OUTPUT", withIntermediateDirectories: true, attributes: nil)
try! fileManager.copyItem(atPath: "xxPROJECTxNAMExx", toPath: "OUTPUT/xxPROJECTxNAMExx")

// Move into OUTPUT and do variable replacement
fileManager.changeCurrentDirectoryPath("OUTPUT")
replaceVariablesInFiles(substitutions: substitutionPairs)
replaceVariablesInFileNames(substitutions: substitutionPairs)

print("Done, your project is now ready to use in the OUTPUT/ folder")
