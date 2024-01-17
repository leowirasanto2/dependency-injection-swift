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
    private lazy var tableView: UITableView = { [weak self] in
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.register(ArticleListCell.self, forCellReuseIdentifier: ArticleListCell.identifier)
        $0.register(TopArticleCell.self, forCellReuseIdentifier: TopArticleCell.identifier)
        $0.separatorStyle = .none
        return $0
    }(UITableView())
    
    init(presenter: ILandingPagePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension LandingPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = presenter.articles?[indexPath.row]
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopArticleCell.identifier, for: indexPath) as? TopArticleCell else { return UITableViewCell(frame: .null) }
            cell.configure(data)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCell.identifier, for: indexPath) as? ArticleListCell else { return UITableViewCell(frame: .null) }
            cell.configure(data)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Headline News"
    }
}

extension LandingPageViewController {
    func newsDataUpdated() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
