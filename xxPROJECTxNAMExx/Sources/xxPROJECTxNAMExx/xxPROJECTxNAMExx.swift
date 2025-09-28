//
//  __PROJECT_NAME__.swift
//  __PROJECT_NAME__
//
//  Created by __AUTHOR_NAME__ on __TODAYS_DATE__.
//  Copyright © __TODAYS_YEAR__ __ORGANIZATION_NAME__. All rights reserved.
//

import Foundation

/// A simple Swift module for demonstrating the template
public struct xxPROJECTxNAMExx {
  /// The name of the module
  public static let name = "xxPROJECTxNAMExx"

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
