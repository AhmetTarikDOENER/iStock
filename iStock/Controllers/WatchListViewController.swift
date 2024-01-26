//
//  ViewController.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 23.01.2024.
//

import UIKit
import FloatingPanel

class WatchListViewController: UIViewController {
    
    private var searchTimer: Timer?
    
    private var panel: FloatingPanelController?

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchController()
        setupTitleView()
        setupFloatingPanel()
    }
    
    //MARK: - Private
    private func setupSearchController() {
        let resultViewController = SearchResultsViewController()
        resultViewController.delegate = self
        let searchViewController = UISearchController(searchResultsController: resultViewController)
        searchViewController.searchResultsUpdater = self
        navigationItem.searchController = searchViewController
    }
    
    private func setupTitleView() {
        let titleView = UIView(frame: CGRect( x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
    
        let label = UILabel(frame: CGRect(x: 5, y: 0, width: titleView.width - 20, height: titleView.height))
        label.text = "Stocks"
        label.font = .systemFont(ofSize: 35, weight: .heavy)
        titleView.addSubview(label)
        
        navigationItem.titleView = titleView
    }
    
    private func setupFloatingPanel() {
        let vc = NewsViewController(type: .topStories)
        let panel = FloatingPanelController(delegate: self)
        panel.surfaceView.backgroundColor = .secondarySystemBackground
        panel.set(contentViewController: vc)
        panel.addPanel(toParent: self)
        panel.track(scrollView: vc.tableView)
    }
}

extension WatchListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultsVC = searchController.searchResultsController as? SearchResultsViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            return
        }
        // Reset timer
        searchTimer?.invalidate()
        
        // Optimize to reduce nimber og searches for when user stops typing.
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: {
            _ in
            // Call API to search
            APIManager.shared.search(query: query) {
                result in
                switch result {
                case .success(let response):
                    // Update resultsViewController
                    DispatchQueue.main.async {
                        resultsVC.update(with: response.result)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        resultsVC.update(with: [])
                    }
                    print(error)
                }
            }
        })
    }
    
}

extension WatchListViewController: SearchResultsViewControllerDelegate {
    func searchResultsViewControllerDidSelect(searchResult: SearchResult) {
        // Present stock details for given selection
        let vc = StockDetailsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        vc.title = searchResult.displaySymbol
        present(navVC, animated: true)
    }
}

extension WatchListViewController: FloatingPanelControllerDelegate {
    
    func floatingPanelDidMove(_ fpc: FloatingPanelController) {
        navigationItem.titleView?.isHidden = fpc.state == .full
    }
    
}
