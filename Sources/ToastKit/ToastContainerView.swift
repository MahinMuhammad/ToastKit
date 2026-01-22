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
            manager.theme.toast
                .transition(.move(edge: .top).combined(with: .opacity))
            Spacer()
        }
        .padding(.horizontal, 25)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
