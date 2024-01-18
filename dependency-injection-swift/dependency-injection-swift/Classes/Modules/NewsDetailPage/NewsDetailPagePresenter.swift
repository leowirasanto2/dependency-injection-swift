//  
//  NewsDetailPagePresenter.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 18/01/24.
//
//  Template author: leowirasanto

import Foundation

class NewsDetailPagePresenter: INewsDetailPagePresenter {
    private let interactor: INewsDetailPageInteractor
    private let router: INewsDetailPageRouter
    private let parameters: [String: Any]?
    private let bridging: IBridging?
    weak var view: INewsDetailPageViewController?
    
    init(bridging: IBridging?, interactor: INewsDetailPageInteractor, router: INewsDetailPageRouter, parameters: [String: Any]?) {
        self.bridging = bridging
        self.interactor = interactor
        self.router = router
        self.parameters = parameters
    }
    
    func viewDidLoad(view: INewsDetailPageViewController) {
        self.view = view
        invokeShowWebView()
    }
    
    func invokeShowWebView() {
        guard let article = parameters?["article-object"] as? Article, let url = URL(string: article.url ?? "") else { return }
        view?.showNewsWebView(url)
    }
}
