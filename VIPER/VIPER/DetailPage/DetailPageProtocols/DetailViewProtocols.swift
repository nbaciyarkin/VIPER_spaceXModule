//
//  DetailViewProtocols.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation
import UIKit

// MARK: -VİEW INPUT- View --> Presenter
protocol DetailPageViewToPresenterConformable {
    var view: DetailPagePresenterToViewConformable? { get set }
    var router: DetailPagePresenterToRouterConformable { get set }
    var interactor: DetailPagePresenterToInteractorConformable { get set }

    func didTapReadArticleButton(navigationController:UINavigationController,with article: String)
    func initialize()
    
}

// MARK: - Presenter --> View
protocol DetailPagePresenterToViewConformable {
    //func onFetchLaunchListSucces()
}

// MARK: -VİEW OUTPUT - Presenter --> Interactor
protocol DetailPagePresenterToInteractorConformable {
    var presenter: DetailPageInteractorToPresenterConformable? { get set }
    //var launches: [LaunchModel] {get set}
    // func fetchLaunchList() eski versiyon
    // yenilnenen versityon
    //func fetchLaunchList() async
    
    
}

// MARK: - Interactor --> Presenter
protocol DetailPageInteractorToPresenterConformable {
    //func fetchLaunchesListSucces (with launches: [LaunchModel])

}

// MARK: - Presenter --> Router
protocol DetailPagePresenterToRouterConformable {
    func initialize()
    func didTapReadArticleButton(navigationController:UINavigationController, article: String)
    //func openTheDetailPage(with model: LaunchModel)
}






