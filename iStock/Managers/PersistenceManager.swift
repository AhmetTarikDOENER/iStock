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
        
    }
    
    //MARK: - Public
    public var watchList: [String] {
        []
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList() {
        
    }
    
    //MARK: - Private
    private var hasOnboarded: Bool {
        false
    }
}
