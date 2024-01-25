//
//  PanelViewController.swift
//  iStock
//
//  Created by Ahmet Tarik DÖNER on 25.01.2024.
//

import UIKit

class PanelViewController: UIViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupGrabber()
    }
    
    //MARK: - Private
    private func setupGrabber() {
        let grabberView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 100,
                height: 10
            )
        )
        grabberView.backgroundColor = .label
        view.addSubview(grabberView)
        grabberView.center = CGPoint(x: view.center.x, y: 5)
    }
}
