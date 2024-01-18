import UIKit

protocol INewsDetailPageModule: BaseModule {
}

protocol INewsDetailPageViewController: AnyObject {
    func showNewsWebView(_ url: URL)
}

protocol INewsDetailPagePresenter: AnyObject {
    func viewDidLoad(view: INewsDetailPageViewController)

    // View to Presenter
    // & Interactor to Presenter
}

protocol INewsDetailPageInteractor: AnyObject {
    // Presenter to Interactor
}

protocol INewsDetailPageRouter: AnyObject {
    // Presenter to Router
}
