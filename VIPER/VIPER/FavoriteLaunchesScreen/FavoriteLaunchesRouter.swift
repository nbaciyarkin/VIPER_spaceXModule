//
//  FavoriteLaunchesRouter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 14.06.2022.
//

import Foundation

class FavoriteLaunchesPageRouter: FavoriteLaunchesPresenterToRouterConformable {
    weak var viewController: FavoriteLaunchesViewController?

    func initialize() {

    }
}

extension FavoriteLaunchesPageRouter {
    static func createModule() -> FavoriteLaunchesViewController {
        let router = FavoriteLaunchesPageRouter()
        let interactor = FavoriteLaunchesInteractor()
        let view = FavoriteLaunchesViewController()
        let presenter = FavoriteLaunchesPresenter(interactor: interactor, router: router)

        presenter.view = view 
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
