//
//  WelcomeRouter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation
import UIKit




class WelcomeRouter: WelcomePresenterToRouterConformable {
    
    func initialize() {
    // do something
    }
    
    
    // MARK: - Scenario start wiht the welcome page
    weak var wiewController: WelcomeViewController?

    func didTapOpenButton(navigationController: UINavigationController) {
        print("ROUTER: Setting the Launch Table Page")
        
        
//        let launchesController = MainTabBarController()
//        navigationController.pushViewController(launchesController,animated: true)
//        
        
        let launchesController = LaunchesPageRouter.createModule()
        navigationController.pushViewController(launchesController,animated: true)
    }

    static func createModule() -> WelcomeViewController {
        let interactor = WelcomePageInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePagePresenter(interactor: interactor, router: router)
        let view = WelcomeViewController()

        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        router.wiewController = view
        return view
    }
    
    
    
    
    
    
}

