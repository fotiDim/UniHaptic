//
//  UniHaptics.swift
//  UniHaptics
//
//  Created by Foti Dim on 14.12.19.
//  Copyright © 2019 navideck. All rights reserved.
//

import UIKit
import CoreHaptics
import AudioToolbox

public struct UniHaptic: Vibrating {
    public func vibrate(intensity: Float = 0.7, sharpness: Float = 0.7) {
        engine.vibrate(intensity: intensity, sharpness: sharpness)
    }

    public init() {

    }
}

protocol Vibrating {
    func vibrate(intensity: Float, sharpness: Float)
}

extension Vibrating {
    var engine: Vibrating {
        if #available(iOS 13.0, *) {
            return CoreHapticsWrapper()
        }
        else if #available(iOS 10.0, *) {
            return FeedbackGeneratorWrapper()
        } else {
            return AudioToolboxWrapper()
        }
    }
}

@available(iOS 13.0,*)
struct CoreHapticsWrapper: Vibrating {
    private var hapticEngine: CHHapticEngine?

    init() {
        hapticEngine = try? CHHapticEngine()
        hapticEngine?.resetHandler = resetHandler
        hapticEngine?.stoppedHandler = restartHandler
        hapticEngine?.playsHapticsOnly = true
        try? start()
    }

    func vibrate(intensity: Float, sharpness: Float) {
        let event = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
            ],
            relativeTime: 0)
        guard let pattern = try? CHHapticPattern(events: [event], parameters: []) else { return }
        let player = try? hapticEngine?.makePlayer(with: pattern)
        try? player?.start(atTime: CHHapticTimeImmediate)
    }



    public func start() throws {
        try hapticEngine?.start()
    }

    private func resetHandler() {
         try? hapticEngine?.start()
    }

    private func restartHandler(_ reasonForStopping: CHHapticEngine.StoppedReason? = nil) {
        resetHandler()
    }
}

@available(iOS 10.0,*)
struct FeedbackGeneratorWrapper: Vibrating {
    let feedbackGenerator = UISelectionFeedbackGenerator()

    init() {
        feedbackGenerator.prepare()
    }

    func vibrate(intensity: Float, sharpness: Float) {
        feedbackGenerator.selectionChanged()
        feedbackGenerator.prepare()
    }
}

struct AudioToolboxWrapper: Vibrating {
    func vibrate(intensity: Float, sharpness: Float) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
