//
//  HapticsManager.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import UIKit

/// Object to manage haptics
final class HapticsManager {
    
    /// Singleton
    static let shared = HapticsManager()
    /// Private constructor
    private init() {}
    
    //MARK: - Public
    /// Vibrate slightly for selection
    public func vibrateForSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    
    /// Play haptic for given type interaction
    /// - Parameter type: Type to vibrate for
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
