import UIKit

protocol ILandingPageModule: BaseModule {
    // Module generator
}

protocol ILandingPageViewController: AnyObject {
    // Presenter to View
}

protocol ILandingPagePresenter: AnyObject {
    func viewDidLoad(view: ILandingPageViewController)
    func toHistory()
    func successFetchNews(_ articles: [Article]?)
    func failedFetchNews(_ error: CustomError)
}

protocol ILandingPageInteractor: AnyObject {
    func fetchNews()
}

protocol ILandingPageRouter: AnyObject {
    func navigateToHistory()
}

protocol ILandingPageService: AnyObject {
    func fetchNews(_ result: @escaping (Result<NewsResponse, CustomError>) -> Void)
}
