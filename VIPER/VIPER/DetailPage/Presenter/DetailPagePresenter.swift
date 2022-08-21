//
//  DetailViewPresenter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation
import UIKit

class DetailPagePresenter: DetailPageViewToPresenterConformable {
    
    var view: DetailPagePresenterToViewConformable?
    var router: DetailPagePresenterToRouterConformable
    var interactor: DetailPagePresenterToInteractorConformable
    
    init(interactor: DetailPagePresenterToInteractorConformable, router: DetailPagePresenterToRouterConformable) {
        self.interactor = interactor
        self.router = router
    }
    
    func initialize() {
        router.initialize()
    }
    func didTapReadArticleButton(navigationController: UINavigationController, with article: String) {
        router.didTapReadArticleButton(navigationController: navigationController, article: article)
    }
    
    
}



