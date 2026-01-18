# ToastKit

A lightweight, window-based toast notification library for SwiftUI.

## Features

- ✨ Zero setup required - just import and use
- 🎯 Always visible - appears on top of sheets, alerts, and full screen covers
- 🎨 Customizable duration
- 👆 Tap to dismiss
- 🔄 Automatic animations

## Installation

### Swift Package Manager

Add ToastKit to your project via Xcode:

1. File → Add Package Dependencies
2. Enter the repository URL
3. Select the version you want to use

Or add it to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/MahinMuhammad/ToastKit.git", from: "1.0.0")
]
```

## Usage

### Basic Usage
```swift
import ToastKit

// Show a toast
ToastManager.shared.show("Hello, World!")

// Show with custom duration
ToastManager.shared.show("Settings saved", duration: 2.0)

// Manually hide
ToastManager.shared.hide()
```

### In Your App
```swift
import SwiftUI
import ToastKit

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Button("Show Toast") {
            ToastManager.shared.show("Button tapped!")
        }
    }
}
```

### Works Everywhere
```swift
// Works on top of sheets
.sheet(isPresented: $showSheet) {
    SheetView()
    Button("Show Toast") {
        ToastManager.shared.show("Works in sheets too!")
    }
}

// Works on top of full screen covers
.fullScreenCover(isPresented: $showCover) {
    CoverView()
}

// Works anywhere in your app
```

## Requirements

- iOS 15.0+
- Swift 5.9+

## License

MIT License - feel free to use in your projects!
```
