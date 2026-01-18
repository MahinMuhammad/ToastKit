//
//  ToastManager.swift
//  toast-swiftui
//
//  Created by Md Mahinur Rahman on 19/1/26.
//


import SwiftUI

@MainActor
public final class ToastManager: ObservableObject {
    public static let shared = ToastManager()
    
    @Published public var message = ""
    @Published public var isVisible = false
    
    private var window: UIWindow?
    
    private init() {
        setupWindow()
    }
    
    private func setupWindow() {
        guard let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
            return
        }
        
        let window = PassThroughWindow(windowScene: scene)
        window.windowLevel = .alert + 1
        window.isHidden = false
        window.isUserInteractionEnabled = true
        
        let hostingController = UIHostingController(rootView: ToastContainerView())
        hostingController.view.backgroundColor = .clear
        window.rootViewController = hostingController
        
        self.window = window
    }
    
    public func show(_ message: String, duration: TimeInterval = 4.0) {
        self.message = message
        withAnimation(.spring()) {
            self.isVisible = true
        }
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            self.hide()
        }
    }
    
    public func hide() {
        withAnimation(.easeOut) {
            self.isVisible = false
        }
    }
}
