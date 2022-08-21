//
//  FavoriteLaunchesProtocols.swift
//  VIPER
//
//  Created by Hamdi Aktar on 14.06.2022.
//

import Foundation
// MARK: - View --> Presenter

protocol FavoriteLaunchesViewControllerToPresenter {
    var view: FavoriteLaunchesPagePresenterToViewConformable? { get set }
    var router: FavoriteLaunchesPresenterToRouterConformable { get set }
    var interactor: FavoriteLaunchesPagePresenterToInteractorConformable { get set }
    
    var launches: [RocketDataModel] { get}
    
    func DeleteLaunchItem(indexPath: IndexPath)

    func initialize()
}


// MARK: - Presenter --> View
protocol FavoriteLaunchesPagePresenterToViewConformable: AnyObject {
    func onFetchSavedLaunchListSucces(with launches: [RocketDataModel])
}



// MARK: - Presenter --> Interactor
protocol FavoriteLaunchesPagePresenterToInteractorConformable: AnyObject {
    func fetchSavedLaunchList()
    func DeleteLaunchItemFromStore(indexPath: IndexPath)
    var favoriteLaunches: [RocketDataModel] {get set}
    
}

// MARK: - Interactor --> Presenter
protocol FavoriteLaunchesInteractorToPresenterConformable: AnyObject {
    func fetchLaunchesListSucces (with launches: [RocketDataModel])

    
}

// MARK: - Presenter --> Router
protocol FavoriteLaunchesPresenterToRouterConformable: AnyObject {
//    func didTapOpenButton(navigationController:UINavigationController)
    func initialize()
}
