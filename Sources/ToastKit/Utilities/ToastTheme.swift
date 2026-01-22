//
//  ToastTheme.swift
//  ToastKit
//
//  Created by Md Mahinur Rahman on 21/1/26.
//

import SwiftUI

public enum ToastTheme {
    case darkSolid, lightSolid
    
    @ViewBuilder
    var toast: some View{
        switch self {
        case .darkSolid:
            DarkSolidToastView()
        case .lightSolid:
            LightSolidToastView()
        }
    }
}
