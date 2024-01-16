//  
//  HistoryPageViewController.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation
import UIKit

class HistoryPageViewController: UIViewController, IHistoryPageViewController {
    private let presenter: IHistoryPagePresenter
    
    init(presenter: IHistoryPagePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
    }
    
    // TODO: add your code here
}
