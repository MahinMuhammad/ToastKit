//
//  ToastType.swift
//  ToastKit
//
//  Created by Md Mahinur Rahman on 21/1/26.
//

import SwiftUI

public enum ToastType {
    case vanilla, info, success, warning, fatal
    
    var icon: Image {
        switch self {
        case .vanilla, .info: Image("ic_info", bundle: .module)
        case .success: Image("ic_check", bundle: .module)
        case .warning, .fatal: Image("ic_exclamatory", bundle: .module)
        }
    }
}
