//  
//  LandingPageViewController.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation
import UIKit

class LandingPageViewController: UIViewController, ILandingPageViewController {
    private let presenter: ILandingPagePresenter
    
    init(presenter: ILandingPagePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(test)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc
    private func test() {
        presenter.toHistory()
    }
}
