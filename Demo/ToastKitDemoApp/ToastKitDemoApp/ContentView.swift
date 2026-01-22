//
//  ContentView.swift
//  ToastKitDemoApp
//
//  Created by Md Mahinur Rahman on 19/1/26.
//

import SwiftUI
import ToastKit

struct ContentView: View {
    @StateObject private var manager = ToastManager.shared
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ToastKit Demo")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Show Toast") {
                manager.show("Custom Toast")
            }
            .buttonStyle(.borderedProminent)
            
            Button("Show Info Toast") {
                manager.show("For your kind information.", type: .info)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Show Success Toast") {
                manager.show("This is a success message!", type: .success)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Show Warning Toast") {
                manager.show("Something is wrong!", type: .warning)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Show Fatal Toast") {
                manager.show("The process is failed!!!", type: .fatal)
            }
            .buttonStyle(.borderedProminent)
            
            Picker("Theme", selection: $manager.theme) {
                Text("Dark Solid").tag(ToastTheme.darkSolid)
                Text("Light Solid").tag(ToastTheme.lightSolid)
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)

        }
    }
}

#Preview {
    ContentView()
}
