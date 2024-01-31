//
//  SearchResponse.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import Foundation

/// API response for search
struct SearchResponse: Codable {
    
    let count: Int
    let result: [SearchResult]
}

/// A single search result
struct SearchResult: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}
