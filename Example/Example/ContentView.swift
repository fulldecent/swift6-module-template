//
//  ContentView.swift
//  iOS Example
//
//  Created by __AUTHOR_NAME__ on __TODAYS_DATE__.
//

import SwiftUI
import swift6_module_template

struct ContentView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text(swift6_module_template.whiteKing())
        .font(.system(size: 120))

      Text(swift6_module_template.greet("SwiftUI"))
        .font(.title2)
        .multilineTextAlignment(.center)
        .padding()

      Text("Module: \(swift6_module_template.name)")
        .font(.caption)
        .foregroundColor(.secondary)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
