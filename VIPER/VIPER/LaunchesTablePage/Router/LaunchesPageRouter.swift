//
//  LaunchesPageRouter.swift
//  VIPER
//
//  Created by Hamdi Aktar on 8.06.2022.
//

import Foundation
import UIKit

typealias EntryPoint = LaunchesPageViewController

class LaunchesPageRouter: LaunchesPagePresenterToRouterConformable {
    var entry: EntryPoint?
    
    func openTheDetailPage(with model: LaunchModel, navCV: UINavigationController) {
        let vc = DetailPageRouter.createModule()
       vc.articleUrl = model.links?.article
//        print(model.links?.article)
        // encapsulation ı bozan yapılar olabilir get set ile protocol e çıkarılıp get ile çekilebilir, atama işlemi yerine göre daha temiz gibi ??   = !!!!  article_URL =  {vc.article}    !!!!
        vc.configure(with: LaunchDetailViewModel(title: model.name ?? "no rocket name" , launchDetail: model.details ?? "no details", articleLink: model.links?.article ?? "https://www.google.com", launch_image: model.links?.patch?.large ?? "https://images2.imgbox.com/4f/e3/I0lkuJ2e_o.png"))
        navCV.pushViewController(vc, animated: true)
    }

    func initialize() {
        
    }
}

extension LaunchesPageRouter {
    static func createModule() -> LaunchesPageViewController {
        let router = LaunchesPageRouter()
        let interactor = LaunchesPageInteractor()
        let view = LaunchesPageViewController()
        let presenter = LaunchesPagePresenter(interactor: interactor, router: router)
        
        presenter.view = view
        view.presenter = presenter 
        
        interactor.presenter = presenter 
        router.entry = view 
        return view
    }
}
