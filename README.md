![UniHaptic: Unified API for Haptic Feedback & Vibration](https://raw.githubusercontent.com/fotiDim/UniHaptic/master/UniHaptic.svg?sanitize=true)

[![iOS 7+](https://img.shields.io/badge/platform-iOS%207%2B-blue.svg)](https://img.shields.io/badge/platform-iOS%209%2B-blue.svg)
[![Swift 5.1](https://img.shields.io/badge/language-Swift%205.1-f48041.svg)](https://img.shields.io/badge/language-swift4-f48041.svg)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-%E2%9C%93-brightgreen.svg?style=flat)](https://img.shields.io/badge/language-swift4-f48041.svg)
[![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://img.shields.io/badge/license-MIT-lightgrey.svg)


Unified API for CHHapticEngine /UIFeedbackGenerator haptic feedback and AudioToolbox vibration. Supports from iOS 13 all the way down to iOS 7.


# Installation
Use Swift Package Manager though Xcode 11. Simply go to `File -> Swift Packages -> Add Package Dependency...` and paste the URL of this repo.

# Usage
The API is meant to be as simple as possible. First do your import:

```swift
import UniHaptic
```
and then simply call it:
```swift
UniHaptic().vibrate()
```

You can have more control by initializing the `UniHaptic` class with a specific style of vibration like this `(UniHaptic(style: .impact)`. The available options are:
- selection
- impact
- notification
- custom

If you don't provide any option the default will be `.selection`. 

You also have the option to provice specific `intensity` and `sharpness` to vibrate:
```swift
UniHaptic().vibrate(intensity: 0.7, sharpness: 0.7)
```

Sharpness is only used if `UniHaptic` was initialized with `.custom` style.

# Minimize Latency
The above example while being simple it does not provide the lowest possible latency. To get minimal latency initialize Unihaptic in a separate call and store its instance:

```swift
class MyClass {
    var unihaptic = UniHaptic()

    func myFunction() {
        unihaptic.vibrate()
    }
}
```

 Then when you call `vibrate()` the latency will be the lowest possible as the Haptic Engine is prepared. For more information read [here](https://developer.apple.com/documentation/uikit/uifeedbackgenerator#2555405).

# Project Status
The project is in its early steps. It is perfectly usable as it is but the API might change.
