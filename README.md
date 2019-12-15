![UniHaptic: Unified API for Haptic Feedback & Vibration](https://raw.githubusercontent.com/fotiDim/UniHaptic/master/UniHaptic.svg?sanitize=true)

[![iOS 7+](https://img.shields.io/badge/platform-iOS%207%2B-blue.svg)](https://img.shields.io/badge/platform-iOS%209%2B-blue.svg)
[![Swift 5.1](https://img.shields.io/badge/language-Swift%205.1-f48041.svg)](https://img.shields.io/badge/language-swift4-f48041.svg)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-%E2%9C%93-brightgreen.svg?style=flat)](https://img.shields.io/badge/language-swift4-f48041.svg)
[![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://img.shields.io/badge/license-MIT-lightgrey.svg)


Unified API for CHHapticEngine /UIFeedbackGenerator haptic feedback and AudioToolbox vibration. Supports from iOS 13 all the way down to iOS 7.


# Installation
Use Swift Package Manager though Xcode 11. Simply go to `File -> Swift Packages -> Add Package Dependency...` and paste the URL of this repo. Under `Rules` select `Branch: master`.

# Usage
The API is meant to be as simple as possible. First do your import:

```
import UniHaptic
```
and then simply call it:
```
UniHaptic().vibrate()
```

or if you want to provide specific values:
```
UniHaptic().vibrate(intensity: 0.7, sharpness: 0.7)
```

# Project Status
The project is in its early steps. For now only a single type of vibration 
is supported. More to come soon!
