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
    // View to Presenter
    // & Interactor to Presenter
}

protocol ILandingPageInteractor: AnyObject {
    // Presenter to Interactor
}

protocol ILandingPageRouter: AnyObject {
    // Presenter to Router
    func navigateToHistory()
}
