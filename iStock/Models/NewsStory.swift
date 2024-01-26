//
//  NewsStory.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 26.01.2024.
//

import Foundation

struct NewsStory: Codable {
    
    let category: String
    let datetime: TimeInterval
    let headline: String
    let image: String
    let related: String
    let source: String
    let summary: String
    let url: String
}
