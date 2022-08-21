//
//  DetailViewRouter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation
import UIKit


class DetailPageRouter: DetailPagePresenterToRouterConformable {
    
    func didTapReadArticleButton(navigationController: UINavigationController, article: String) {
        let articleView = ArticlePageRouter.createModule()
        articleView.configure(with: article)
        navigationController.pushViewController(articleView, animated: true)
    }

    weak var viewController: LaunchDetailViewController?

    func initialize() {

    }
}

extension DetailPageRouter {
    static func createModule() -> LaunchDetailViewController {
        let router = DetailPageRouter()
        let interactor = DetailPageInteractor()
        let view = LaunchDetailViewController()
        let presenter = DetailPagePresenter(interactor: interactor, router: router)


        presenter.view = view as? DetailPagePresenterToViewConformable
        view.presenter = presenter
        
        print("details")

        interactor.presenter = presenter as? DetailPageInteractorToPresenterConformable
        router.viewController = view
        return view
    }
}
