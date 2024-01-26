//
//  TopStoriesNewsViewController.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 24.01.2024.
//

import UIKit

class NewsViewController: UIViewController {

    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        
        return table
    }()
    
    enum  `Type` {
        case topStories
        case company(symbol: String)
        
        var title: String {
            switch self {
            case .topStories:
                "Top Stories"
            case .company(let symbol):
                symbol.uppercased()
            }
        }
    }
    
    let type: Type
    
    //MARK: - Init
    init(type: Type) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        fetchNews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - Private
    private func setupTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fetchNews() {
        
    }
    
    private func open(url: URL) {
        
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
