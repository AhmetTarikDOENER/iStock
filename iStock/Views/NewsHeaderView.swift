//
//  NewsHeaderView.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 26.01.2024.
//

import UIKit

/// Delegate to notify of header events
protocol NewsHeaderViewDelegate: AnyObject {
    /// Notify user tapped header button
    /// - Parameter headerView: Reference of header view
    func newsHeaderViewDidTapAddButton(_ headerView: NewsHeaderView)
}

/// Table view header for news
final class NewsHeaderView: UITableViewHeaderFooterView {
    
    /// Header identifier
    static let identifier = "NewsHeaderView"
    /// Ideal height of header
    static let preferredHeight: CGFloat = 50
    
    /// Delegate instance for events
    weak var delegate: NewsHeaderViewDelegate?
    
    /// ViewModel for header view
    struct ViewModel {
        let title: String
        let shouldShowAddButton: Bool
    }
    //MARK: - Private
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .ultraLight)
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("+ Watchlist", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setCornerRadius(8)
        button.layer.masksToBounds = true
        
        return button
    }()
    
    //MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(label, button)
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(
            x: 14,
            y: 0,
            width: contentView.width - 28,
            height: contentView.height
        )
        button.sizeToFit()
        button.frame = CGRect(
            x: contentView.width - button.width - 16,
            y: (contentView.height - button.height) / 2,
            width: button.width + 10,
            height: button.height
        )
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    /// Handle button tap
    @objc private func didTapAddButton() {
        delegate?.newsHeaderViewDidTapAddButton(self)
    }
    
    /// Configure view
    /// - Parameter viewModel: view ViewModel
    public func configure(with viewModel: ViewModel) {
        label.text = viewModel.title
        button.isHidden = !viewModel.shouldShowAddButton
    }
}
