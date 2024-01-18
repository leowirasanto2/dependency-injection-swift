//  
//  NewsDetailPageViewController.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 18/01/24.
//
//  Template author: leowirasanto

import Foundation
import UIKit
import WebKit

class NewsDetailPageViewController: UIViewController, INewsDetailPageViewController {
    private let presenter: INewsDetailPagePresenter
    private var webView: WKWebView?
    private var observation: NSKeyValueObservation?
    
    private lazy var topLoadingBar: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .green
        return $0
    }(UIView())
    
    private var screenWidth: CGFloat {
        view.frame.width
    }
    
    private var loadingBarWidth: NSLayoutConstraint?
    
    init(presenter: INewsDetailPagePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        loadingBarWidth = nil
        observation = nil
        webView = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingBar()
        setupWebView()
        presenter.viewDidLoad(view: self)
    }
    
    private func setupWebView() {
        webView = WKWebView()
        webView?.navigationDelegate = self
        webView?.translatesAutoresizingMaskIntoConstraints = false
        
        observation = webView?.observe(\.estimatedProgress, options: [.new]) { [weak self] _, change in
            let progress = ((self?.screenWidth ?? 0) * CGFloat(change.newValue ?? 0))
            print(progress)
            self?.loadingBarWidth?.constant = progress
        }
        
        if let webView = webView {
            view.addSubview(webView)
            NSLayoutConstraint.activate([
                webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
        
        view.bringSubviewToFront(topLoadingBar)
    }
    
    private func setupLoadingBar() {
        view.addSubview(topLoadingBar)
        NSLayoutConstraint.activate([
            topLoadingBar.heightAnchor.constraint(equalToConstant: 4),
            
            topLoadingBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLoadingBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        loadingBarWidth = topLoadingBar.widthAnchor.constraint(equalToConstant: 0)
        loadingBarWidth?.isActive = true
    }
}

extension NewsDetailPageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("error webview: \(error.localizedDescription)")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        topLoadingBar.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
}

extension NewsDetailPageViewController {
    func showNewsWebView(_ url: URL) {
        webView?.load(URLRequest(url: url))
        webView?.allowsBackForwardNavigationGestures = true
    }
}
