import UIKit

protocol ILandingPageModule: BaseModule {
    // Module generator
}

protocol ILandingPageViewController: AnyObject {
    func newsDataUpdated()
}

protocol ILandingPagePresenter: AnyObject {
    var articles: [Article]? { get set }
    
    func viewDidLoad(view: ILandingPageViewController)
    func toHistory()
    func successFetchNews(_ articles: [Article]?)
    func failedFetchNews(_ error: CustomError)
}

protocol ILandingPageInteractor: AnyObject {
    func fetchHeadlineNews(countryCode: String)
}

protocol ILandingPageRouter: AnyObject {
    func navigateToHistory()
}

protocol ILandingPageService: AnyObject {
    func fetchHeadlineNews(countryCode: String, _ result: @escaping (Result<NewsResponse, CustomError>) -> Void)
}
