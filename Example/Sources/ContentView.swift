//
//  ContentView.swift
//  iOS Example
//
//  Created by Test Author on January 1, 2024.
//

import SwiftUI
import TestModule

struct ContentView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text(TestModule.whiteKing())
        .font(.system(size: 120))

      Text(TestModule.greet("SwiftUI"))
        .font(.title2)
        .multilineTextAlignment(.center)
        .padding()

      Text("Module: \(TestModule.name)")
        .font(.caption)
        .foregroundColor(.secondary)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
