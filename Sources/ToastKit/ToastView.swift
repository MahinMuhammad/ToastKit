//
//  ToastView.swift
//  toast-swiftui
//
//  Created by Md Mahinur Rahman on 19/1/26.
//


import SwiftUI

struct ToastView: View {
    @StateObject private var manager = ToastManager.shared
    
    var body: some View {
        if manager.isVisible{
            Text(manager.message)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
                .shadow(radius: 4)
                .onTapGesture {
                    manager.hide()
                }
        }
    }
}
