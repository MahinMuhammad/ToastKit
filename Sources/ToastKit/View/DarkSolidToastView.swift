//
//  ToastView.swift
//  toast-swiftui
//
//  Created by Md Mahinur Rahman on 19/1/26.
//


import SwiftUI

struct DarkSolidToastView: View {
    @StateObject private var manager = ToastManager.shared
    
    var body: some View {
        if manager.isVisible {
            HStack(spacing: 12) {
                manager.type.icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(icColor)
                    .padding(6.25)
                    .background(Circle().foregroundColor(icColor.opacity(0.1)))
                
                Text(manager.message)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(K.CustomColor.black)
            .cornerRadius(16)
        }
    }
    
    var icColor: Color {
        switch manager.type {
        case .vanilla: .white
        case .info: K.CustomColor.blue
        case .success: K.CustomColor.green
        case .warning: K.CustomColor.yellow
        case .fatal: K.CustomColor.red
        }
    }
}
