//
//  iStockTests.swift
//  iStockTests
//
//  Created by Ahmet Tarik DÖNER on 31.01.2024.
//

import XCTest
@testable import iStock

final class iStockTests: XCTestCase {

    func test_CandleStick_DataConversion() {
        let doubles: [Double] = Array(repeating: 12.2, count: 10)
        var timestamps: [TimeInterval] = []
        for x in 0..<10 {
            let interval = Date().addingTimeInterval(3600 * TimeInterval(x)).timeIntervalSince1970
            timestamps.append(interval)
        }
        timestamps.shuffle()
        let marketData = MarketDataResponse(
            close: doubles,
            high: doubles,
            low: doubles,
            open: doubles,
            status: doubles,
            timestamps: timestamps
        )
        let candleSticks = marketData.candleSticks
        XCTAssertEqual(candleSticks.count, marketData.open.count)
        XCTAssertEqual(candleSticks.count, marketData.close.count)
        XCTAssertEqual(candleSticks.count, marketData.high.count)
        XCTAssertEqual(candleSticks.count, marketData.low.count)
        XCTAssertEqual(candleSticks.count, marketData.timestamps.count)
        
        // Verify sort
        let dates = candleSticks.map { $0.date }
        for x in 0..<dates.count - 1 {
            let current = dates[x]
            let next = dates[x + 1]
            XCTAssertTrue(current > next, "\(current) date should be greater than \(next) date")
        }
    }
}
