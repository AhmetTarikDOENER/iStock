//
//  ViewController.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 23.01.2024.
//

import UIKit

class WatchListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchController()
    }
    
    private func setupSearchController() {
        let resultViewController = SearchResultsViewController()
        let searchViewController = UISearchController(searchResultsController: resultViewController)
        searchViewController.searchResultsUpdater = self
        navigationItem.searchController = searchViewController
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
