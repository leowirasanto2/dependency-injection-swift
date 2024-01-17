//
//  AppRouter.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Swinject
import Foundation
import UIKit

protocol IAppRouter: ProductRouter {
    var navigationController: UINavigationController? { get set }
    var resolver: Resolver { get }
    var bridging: IBridging? { get }
    
    func presentView(_ view: UIViewController?, animated: Bool)
    func pushView(_ view: UIViewController?, animated: Bool)
    func popVC(animated: Bool)
    func setViewControllerToStack(_ view: UIViewController?)
}

class AppRouter: IAppRouter {
    private let productConstructor: (_ appRouter: IAppRouter) -> ProductRouter
    private var rootVC: UIViewController?
    var resolver: Resolver
    var navigationController: UINavigationController?
    var bridging: IBridging?
    
    init(assembler: Assembler, productConstructor: @escaping (_ appRouter: IAppRouter) -> ProductRouter) {
        self.resolver = assembler.resolver
        self.productConstructor = productConstructor
        self.bridging = resolver.resolve(Bridging.self)
    }
    
    func presentModule(_ module: Module, parameters: [String : Any]) {
        let product = productConstructor(self)
        product.presentModule(module, parameters: parameters)
    }
    
    func presentView(_ view: UIViewController?, animated: Bool) {
        guard let view = view else { return }
        view.modalPresentationStyle = .overFullScreen
        navigationController?.present(view, animated: animated)
    }

    func pushView(_ view: UIViewController?, animated: Bool) {
        guard let view = view else { return }
        navigationController?.pushViewController(view, animated: animated)
    }
    
    func popVC(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func setViewControllerToStack(_ view: UIViewController?) {
        if let v = view, navigationController?.viewControllers.first(where: {$0 == v}) == nil {
            navigationController?.viewControllers.append(v)
        }
    }
}
