//
//  ToastContainerView.swift
//  toast-swiftui
//
//  Created by Md Mahinur Rahman on 19/1/26.
//

import SwiftUI

struct ToastContainerView: View {
    var body: some View {
        VStack {
            ToastView()
                .transition(.move(edge: .top).combined(with: .opacity))
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
