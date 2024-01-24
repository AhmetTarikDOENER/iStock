//
//  SearchResponse.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import Foundation

struct SearchResponse: Codable {
    
    let count: Int
    let result: [SearchResult]
}

struct SearchResult: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}
