//
//  DarkSolidToastView 2.swift
//  
//
//  Created by Md Mahinur Rahman on 22/1/26.
//


import SwiftUI

struct LightSolidToastView: View {
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
                    .foregroundColor(K.CustomColor.black)
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(16)
        }
    }
    
    var icColor: Color {
        switch manager.type {
        case .vanilla: K.CustomColor.black
        case .info: K.CustomColor.blue
        case .success: K.CustomColor.green
        case .warning: K.CustomColor.yellow
        case .fatal: K.CustomColor.red
        }
    }
}
