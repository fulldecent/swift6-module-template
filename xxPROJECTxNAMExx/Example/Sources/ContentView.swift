//
//  ContentView.swift
//  iOS Example
//
//  Created by __AUTHOR_NAME__ on __TODAYS_DATE__.
//

import SwiftUI
import xxPROJECTxNAMExx

struct SwiftUIxxPROJECTxNAMExx: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return xxPROJECTxNAMExx()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            SwiftUIxxPROJECTxNAMExx()
        }
    }
}

#Preview {
    ContentView()
}
