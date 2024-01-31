//
//  PersistenceManager.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import Foundation

/// Object to manage saved caches
final class PersistenceManager {
    
    /// Singleton
    static let shared = PersistenceManager()
    /// Private constuctor
    private init() {}
    
    /// Reference to userDefaults
    private let userDefaults: UserDefaults = .standard
    
    /// Constants
    private struct Constants {
        
        static let onboardedKey = "hasOnboarded"
        static let watchlistKey = "watchlist"
    }
    
    //MARK: - Public
    /// Get user watchlist
    public var watchList: [String] {
        if !hasOnboarded {
            userDefaults.set(true, forKey: Constants.onboardedKey)
            setupDefaults()
        }
        
        return userDefaults.stringArray(forKey: Constants.watchlistKey) ?? []
    }
    
    /// Check if watchlist contains item
    /// - Parameter symbol: Symbol to check
    /// - Returns: Boolean
    public func watchlistContains(symbol: String) -> Bool {
        watchList.contains(symbol)
    }
    
    /// Add a symbol to watchlist
    /// - Parameters:
    ///   - symbol: Symbol to add
    ///   - companyName: Company name for symbol being added
    public func addToWatchList(symbol: String, companyName: String) {
        var current = watchList
        current.append(symbol)
        userDefaults.set(current, forKey: Constants.watchlistKey)
        userDefaults.set(companyName, forKey: symbol)
        NotificationCenter.default.post(name: .didAddToWatchlist, object: nil)
    }
    
    /// Remove item from watchlist
    /// - Parameter symbol: Symbol to remove
    public func removeFromWatchList(symbol: String) {
        var newList = [String]()
        userDefaults.set(nil, forKey: symbol)
        for item in watchList where item != symbol {
            newList.append(item)
        }
        userDefaults.set(newList, forKey: Constants.watchlistKey)
    }
    
    //MARK: - Private
    /// Check if user has been onboarded already
    private var hasOnboarded: Bool {
        userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
    /// Set up default watchlist items
    private func setupDefaults() {
        let map: [String: String] = [
            "AAPL": "Apple Inc.",
            "MSFT": "Microsoft Corporation",
            "SNAP": "Snap Inc.",
            "GOOG": "Alphabet",
            "AMZN": "Amazon.com, Inc.",
            "WORK": "Slack Technologies",
            "FB": "Facebook Inc.",
            "NVDA": "Nvidia Inc.",
            "NKE": "Nike",
            "PINS": "Pinterest Inc."
        ]
        let symbols = map.keys.map { $0 }
        userDefaults.setValue(symbols, forKey: Constants.watchlistKey)
        for (symbol, name) in map {
            userDefaults.set(name, forKey: symbol)
        }
    }
}
