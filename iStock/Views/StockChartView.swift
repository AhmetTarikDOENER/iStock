//
//  StockChartView.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 26.01.2024.
//

import UIKit
import DGCharts

class StockChartView: UIView {
    
    struct ViewModel {
        
        let data: [Double]
        let showLegend: Bool
        let showAxis: Bool
    }
    
    private let chartView: LineChartView = {
        let chartView = LineChartView()
        chartView.pinchZoomEnabled = false
        chartView.setScaleEnabled(true)
        chartView.xAxis.enabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.legend.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        
        return chartView
    }()

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(chartView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chartView.frame = bounds
    }
    
    func reset() {
        chartView.data = nil
    }
    
    func configure(with viewModel: ViewModel) {
        var entries = [ChartDataEntry]()
        for (index, value) in viewModel.data.enumerated() {
            entries.append(
                .init(
                    x: Double(index),
                    y: value
                )
            )
        }
        let dataSet = LineChartDataSet(entries: entries, label: "Some Label")
        dataSet.fillColor = .systemBlue
        dataSet.drawFilledEnabled = true
        dataSet.drawIconsEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.drawCircleHoleEnabled = false
        let data = LineChartData(dataSet: dataSet)
        chartView.data = data
    }
}
