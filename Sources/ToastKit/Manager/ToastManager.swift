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
    @Published public var theme: ToastTheme = .darkSolid
    
    @Published internal var type: ToastType = .vanilla
    
    private var window: UIWindow?
    private var isWindowSetup = false
    
    private init() {}
    
    private func setupWindowIfNeeded() {
        guard !isWindowSetup else { return }
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
        self.isWindowSetup = true
        
        /// Give the view hierarchy a moment to settle
        /// This ensures animations work on first show
        Task {
            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 second
        }
    }
    
    public func show(_ message: String, type: ToastType = .vanilla, for duration: TimeInterval = 4.0) {
        setupWindowIfNeeded()
        
        // Small delay to ensure window is ready on first call
        Task { @MainActor in
            // If this is the first show, wait a tiny bit
            if !isVisible {
                try? await Task.sleep(nanoseconds: 50_000_000) // 0.05 second
            }
            
            self.message = message
            self.type = type
            withAnimation(.spring()) {
                self.isVisible = true
            }
            
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
