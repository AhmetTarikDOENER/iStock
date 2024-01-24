//
//  SearchResultTableViewCell.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
