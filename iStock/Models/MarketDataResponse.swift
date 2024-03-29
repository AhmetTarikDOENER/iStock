//
//  MarketDataResponse.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 26.01.2024.
//

import Foundation

/// Market data response
struct MarketDataResponse: Codable {
    
    let close: [Double]
    let high: [Double]
    let low: [Double]
    let open: [Double]
    let status: [Double]
    let timestamps: [TimeInterval]
    
    enum CodingKeys: String, CodingKey {
        case close = "c"
        case high = "h"
        case low = "l"
        case open = "o"
        case status = "s"
        case timestamps = "t"
    }
    
    /// Convet market data to array of candle stick model
    var candleSticks: [CandleStick] {
        var result = [CandleStick]()
        for index in 0..<open.count {
            result.append(
                .init(
                    date: Date(timeIntervalSince1970: timestamps[index]),
                    high: high[index],
                    low: low[index],
                    open: open[index],
                    close: close[index]
                )
            )
        }
        let sortedData = result.sorted(by: { $0.date > $1.date })
        return sortedData
    }
    
}

/// Model to represent data for single day
struct CandleStick {
    
    let date: Date
    let high: Double
    let low: Double
    let open: Double
    let close: Double
}
