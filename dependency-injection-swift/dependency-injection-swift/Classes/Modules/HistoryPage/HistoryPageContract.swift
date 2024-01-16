import UIKit

protocol IHistoryPageModule: BaseModule {
}

protocol IHistoryPageViewController: AnyObject {
    // Presenter to View
}

protocol IHistoryPagePresenter: AnyObject {
    func viewDidLoad(view: IHistoryPageViewController)

    // View to Presenter
    // & Interactor to Presenter
}

protocol IHistoryPageInteractor: AnyObject {
    // Presenter to Interactor
}

protocol IHistoryPageRouter: AnyObject {
    // Presenter to Router
}
