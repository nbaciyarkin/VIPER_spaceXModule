//
//  ArticlePageRouter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation
class ArticlePageRouter: ArticlePagePresenterToRouterConformable {
    weak var viewController: ArticlePageViewController?

    func initialize() {

    }
}

extension ArticlePageRouter {
    static func createModule() -> ArticlePageViewController {
        let router = ArticlePageRouter()
        let interactor = ArticlePageInteractor()
        let view = ArticlePageViewController()
        let presenter = ArticlePagePresenter(interactor: interactor, router: router)


        presenter.view = view as? ArticlePagePresenterToViewConformable
        view.presenter = presenter
        
//        print("details")
        
        interactor.presenter = presenter as? ArticlePageInteractorToPresenterConformable
        router.viewController = view
        return view
    }
}
