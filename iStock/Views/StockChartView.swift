//
//  StockChartView.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 26.01.2024.
//

import UIKit

class StockChartView: UIView {
    
    struct ViewModel {
        
        let data: [Double]
        let showLegend: Bool
        let showAxis: Bool
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func reset() {
        
    }
    
    func configure(with viewModel: ViewModel) {
        
    }
}
