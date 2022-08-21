//
//  ArticlePagePresenter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation

class ArticlePagePresenter: ArticlePageViewToPresenterConformable {
    
    
    var view: ArticlePagePresenterToViewConformable?
    var router: ArticlePagePresenterToRouterConformable
    var interactor: ArticlePagePresenterToInteractorConformable
    
    init(interactor: ArticlePagePresenterToInteractorConformable, router: ArticlePagePresenterToRouterConformable) {
        self.interactor = interactor
        self.router = router
    }
    
    func initialize() {
        router.initialize()
    }
}

extension LaunchesPagePresenter: ArticlePageInteractorToPresenterConformable {
    
}
