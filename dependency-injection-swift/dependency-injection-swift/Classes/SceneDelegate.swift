//
//  SceneDelegate.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Swinject
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var appRouter: IAppRouter?
    
    var navigationController: UINavigationController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let basePage = BasePage()
        let navigationController = UINavigationController(rootViewController: basePage)
        self.navigationController = navigationController
        self.appRouter = createAppRouter()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.open(PageModule.landing, navigationController: navigationController)
        }
    }
    
    func open(_ module: Module, navigationController: UINavigationController?) {
        appRouter?.presentModule(module, parameters: [:])
    }
    
    func createAppRouter() -> IAppRouter? {
        let productConstructors: (_ appRouter: IAppRouter) -> ProductRouter = { appRouter in
            appRouter.navigationController = self.navigationController
            return ModuleFactory(appRouter: appRouter)
        }
        let assembler = Assembler()
        assembler.apply(assemblies: ModuleFactory.getAssemblies())
        return AppRouter(assembler: assembler, productConstructor: productConstructors)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

