//
//  BasePage.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation
import UIKit

class BasePage: UIViewController {

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Hello World!"
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
