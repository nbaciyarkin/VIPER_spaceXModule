//
//  LaunchesPagePresenter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
import Foundation
import UIKit


class LaunchesPagePresenter: LaunchesPageViewToPresenterConformable {

    var launches: [LaunchModel] {interactor.launches}
    
    var view: LaunchesPagePresenterToViewConformable?
    var router: LaunchesPagePresenterToRouterConformable
    var interactor: LaunchesPagePresenterToInteractorConformable
    
    init(interactor: LaunchesPagePresenterToInteractorConformable, router: LaunchesPagePresenterToRouterConformable) {
        self.interactor = interactor
        self.router = router
    }
    
    func initialize() {
        router.initialize()
    }
    
    func didTapCell(with model: LaunchModel, navController: UINavigationController) {
        // hey I am the view controller: Go router and call openDetailPage
        //router.openDetailPage()
        router.openTheDetailPage(with: model, navCV: navController)
    }
    func didTapContextSaveButton(with model: LaunchModel) {
        // hey I am the view controller: Go interactor and call saveRocketItem
        interactor.SaveTheRocketItem(with: model)
    }
}

extension LaunchesPagePresenter: LaunchesPageInteractorToPresenterConformable {
    func fetchLaunchesListSucces(with launches: [LaunchModel]) {
        view?.onFetchLaunchListSucces()
    }
}







