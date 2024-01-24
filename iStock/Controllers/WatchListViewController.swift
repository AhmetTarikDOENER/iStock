//
//  ViewController.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 23.01.2024.
//

import UIKit

class WatchListViewController: UIViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchController()
        setupTitleView()
    }
    
    //MARK: - Private
    private func setupSearchController() {
        let resultViewController = SearchResultsViewController()
        let searchViewController = UISearchController(searchResultsController: resultViewController)
        searchViewController.searchResultsUpdater = self
        navigationItem.searchController = searchViewController
    }
    
    private func setupTitleView() {
        let titleView = UIView(frame: CGRect( x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        
        let label = UILabel(frame: CGRect(x: 5, y: 0, width: titleView.width - 20, height: titleView.height))
        label.text = "Stocks"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        titleView.addSubview(label)
        
        navigationItem.titleView = titleView
    }

}

extension WatchListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultsVC = searchController.searchResultsController as? SearchResultsViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            return
        }
        // Optimize to reduce nimber og searches for when user stops typing.
        
        // Call API to search
        
        // Update resultsViewController
    }
    
}
