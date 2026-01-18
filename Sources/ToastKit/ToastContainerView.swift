//
//  ToastContainerView.swift
//  toast-swiftui
//
//  Created by Md Mahinur Rahman on 19/1/26.
//

import SwiftUI

struct ToastContainerView: View {
    @StateObject private var manager = ToastManager.shared
    
    var body: some View {
        VStack {
            if manager.isVisible {
                ToastView()
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
