//
//  PersistenceManager.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import Foundation

final class PersistenceManager {
    
    static let shared = PersistenceManager()
    private init() {}
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        
        static let onboardedKey = "hasOnboarded"
        static let watchlistKey = "watchlist"
    }
    
    //MARK: - Public
    public var watchList: [String] {
        if !hasOnboarded {
            userDefaults.set(true, forKey: Constants.onboardedKey)
            setupDefaults()
        }
        
        return userDefaults.stringArray(forKey: Constants.watchlistKey) ?? []
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList(symbol: String) {
        var newList = [String]()
        userDefaults.set(nil, forKey: symbol)
        for item in watchList where item != symbol {
            newList.append(item)
        }
        userDefaults.set(newList, forKey: Constants.watchlistKey)
    }
    
    //MARK: - Private
    private var hasOnboarded: Bool {
        userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
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
