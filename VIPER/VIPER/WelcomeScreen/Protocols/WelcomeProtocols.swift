//
//  WelcomeProtocols.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation
import UIKit

// MARK: - View --> Presenter

protocol WelcomeViewControllerToPresenter {
    var view: WelcomePagePresenterToViewConformable? { get set }
    var router: WelcomePresenterToRouterConformable { get set }
    var interactor: WelcomePagePresenterToInteractorConformable { get set }
    func didTapOpenButton(navigationController:UINavigationController)
    func initialize()
}


// MARK: - Presenter --> View
protocol WelcomePagePresenterToViewConformable: AnyObject {
    func didTapOpenButton(navigationController:UINavigationController)
}



// MARK: - Presenter --> Interactor
protocol WelcomePagePresenterToInteractorConformable: AnyObject {
    
}

// MARK: - Interactor --> Presenter
protocol WelcomePageInteractorToPresenterConformable: AnyObject {
    
}

// MARK: - Presenter --> Router
protocol WelcomePresenterToRouterConformable: AnyObject {
    func didTapOpenButton(navigationController:UINavigationController)
    func initialize()
}
