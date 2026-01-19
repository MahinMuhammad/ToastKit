//
//  ContentView.swift
//  ToastKitDemoApp
//
//  Created by Md Mahinur Rahman on 19/1/26.
//

import SwiftUI
import ToastKit

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ToastKit Demo")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Show Toast") {
                ToastManager.shared.show("Custom Toast", duration: 2.0)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Show Long Toast") {
                ToastManager.shared.show("This is a longer message!", duration: 4.0)
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ContentView()
}
