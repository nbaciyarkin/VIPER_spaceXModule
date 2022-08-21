//
//  FavoriteLaunchesPresenter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 14.06.2022.
//

import Foundation

class FavoriteLaunchesPresenter: FavoriteLaunchesViewControllerToPresenter {
    func DeleteLaunchItem(indexPath: IndexPath) {
        interactor.DeleteLaunchItemFromStore(indexPath: indexPath)
    }
    
    var launches: [RocketDataModel]  {interactor.favoriteLaunches}
    
    
    //var favoritesLaunches: [RocketDataModel] {interactor.launches}
    
    var view: FavoriteLaunchesPagePresenterToViewConformable?
    var router: FavoriteLaunchesPresenterToRouterConformable
    var interactor: FavoriteLaunchesPagePresenterToInteractorConformable
    

    init(interactor: FavoriteLaunchesPagePresenterToInteractorConformable, router: FavoriteLaunchesPresenterToRouterConformable) {
        self.interactor = interactor
        self.router = router
        print(launches)
    }
    
    func initialize() {
        router.initialize()
    }
}

extension FavoriteLaunchesPresenter: FavoriteLaunchesInteractorToPresenterConformable {
    func fetchLaunchesListSucces(with launches: [RocketDataModel]) {
        view?.onFetchSavedLaunchListSucces(with: launches)
    }
}


