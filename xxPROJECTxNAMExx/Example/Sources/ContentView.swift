//
//  ContentView.swift
//  iOS Example
//
//  Created by __AUTHOR_NAME__ on __TODAYS_DATE__.
//

import SwiftUI
import xxPROJECTxNAMExx

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(xxPROJECTxNAMExx.whiteKing())
                .font(.system(size: 120))
            
            Text(xxPROJECTxNAMExx.greet("SwiftUI"))
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Module: \(xxPROJECTxNAMExx.name)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
