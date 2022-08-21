//
//  WelcomePagePresenter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation
import UIKit


class WelcomePagePresenter: WelcomeViewControllerToPresenter {

    
 
    var view: WelcomePagePresenterToViewConformable?
    var router: WelcomePresenterToRouterConformable
    var interactor: WelcomePagePresenterToInteractorConformable
    

        
    init(interactor: WelcomePagePresenterToInteractorConformable, router: WelcomePresenterToRouterConformable) {
        self.interactor = interactor
        self.router = router
    }
    
    func initialize() {
        router.initialize()
    }
    
    func didTapOpenButton(navigationController: UINavigationController) {
        print("presenter: hey router call the didTapButton")
        router.didTapOpenButton(navigationController: navigationController)
    }


}

extension WelcomePagePresenter: WelcomePageInteractorToPresenterConformable {
    
}
