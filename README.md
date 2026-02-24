# CSOTPView
This is the CSOTPView using 4 digit OTP handle in textfield

📱 CSOTPView

CSOTPView is a customizable OTP (One-Time Password) input component for iOS applications built using Swift.
It provides a clean, secure, and user-friendly interface for entering OTP/PIN codes with full customization support.

This package is distributed via Swift Package Manager (SPM) and supports iOS 13+.

✨ Features

Custom OTP/PIN input view

Fully customizable UI (colors, fonts, spacing, border)

Secure OTP entry

Auto focus & cursor handling

Supports auto-fill OTP from SMS

Light-weight and easy integration

SPM supported (no CocoaPods required)

📦 Installation (Swift Package Manager)
Method 1 — Xcode Integration

Open your iOS project in Xcode

Go to File → Add Package Dependencies

Enter repository URL:

https://github.com/YOUR_USERNAME/CSOTPView.git

Select latest version

Click Add Package

Method 2 — Package.swift

Add dependency in your Package.swift:

dependencies: [
    .package(url: "https://github.com/YOUR_USERNAME/CSOTPView.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: ["CSOTPView"]
    )
]
🚀 Usage

Import package:

import CSOTPView

Create OTP View:

let otpView = CSOTPView()
otpView.numberOfDigits = 6
otpView.spacing = 12
otpView.textColor = .black
otpView.borderColor = .gray
otpView.focusBorderColor = .systemBlue

Add into view:

otpView.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
self.view.addSubview(otpView)

Get OTP value:

let enteredOTP = otpView.getOTP()
print(enteredOTP)
🎨 Customization Options

You can customize:

OTP digits count

Border color

Focus color

Text font & color

Spacing between boxes

Background color

Corner radius

📁 Resources Support

This package includes bundled resources such as:

XIB files

Assets

Custom UI resources

Already configured in Package.swift:

resources: [
    .process("Resources")
]
🔧 Requirements

iOS 13.0+

Swift 5.9+

Xcode 15+

👨‍💻 Author

Developed by @Mintoak

📄 License

Internal/Private SDK (or add MIT if public)
