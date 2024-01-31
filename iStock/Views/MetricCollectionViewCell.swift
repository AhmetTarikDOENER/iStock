//
//  MetricCollectionViewCell.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 30.01.2024.
//

import UIKit

/// Metric tableView cell
final class MetricCollectionViewCell: UICollectionViewCell {
    
    /// identifier for a cell
    static let identifier = "MetricCollectionViewCell"
    
    /// Metric tableView cell ViewModel
    struct ViewModel {
        
        let name: String
        let value: String
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        
        return label
    }()
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        addSubviews(nameLabel, valueLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        valueLabel.sizeToFit()
        nameLabel.sizeToFit()
        nameLabel.frame = CGRect(
            x: 3,
            y: 0,
            width: nameLabel.width,
            height: contentView.height
        )
        valueLabel.frame = CGRect(
            x: nameLabel.right + 3,
            y: 0,
            width: valueLabel.width,
            height: contentView.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        valueLabel.text = nil
    }
    
    /// Configure view
    /// - Parameter viewModel: views ViewModel
    func configure(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name + ":"
        valueLabel.text = viewModel.value
    }
}
