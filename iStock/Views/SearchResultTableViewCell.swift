//
//  SearchResultTableViewCell.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import UIKit

/// Table view cell for search result
final class SearchResultTableViewCell: UITableViewCell {
    
    /// Identifier for a cell
    static let identifier = "SearchResultTableViewCell"
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
