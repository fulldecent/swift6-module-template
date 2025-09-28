//
//  __PROJECT_NAME__.swift
//  __PROJECT_NAME__
//
//  Created by Test Author on January 1, 2024.
//  Copyright © 2024 Test Organization. All rights reserved.
//

import Foundation

/// A simple Swift module for demonstrating the template
public struct TestModule {
  /// The name of the module
  public static let name = "TestModule"

  /// A simple greeting function
  /// - Parameter name: The name to greet
  /// - Returns: A greeting message
  public static func greet(_ name: String = "World") -> String {
    return "Hello, \(name)! This is \(self.name)."
  }

  /// Get the white king character
  /// - Returns: The white king Unicode character
  public static func whiteKing() -> String {
    return "♔"
  }
}
