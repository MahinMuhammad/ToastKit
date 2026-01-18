//
//  PassThroughWindow.swift
//  toast-swiftui
//
//  Created by Md Mahinur Rahman on 19/1/26.
//

import UIKit

// PassThroughWindow: Allows touches to pass through to underlying windows
class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == rootViewController?.view ? nil : view
    }
}
