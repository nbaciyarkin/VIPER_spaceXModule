//
//  ArticlePageProtocols.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation

// MARK: -VİEW INPUT- View --> Presenter
protocol ArticlePageViewToPresenterConformable {
    var view: ArticlePagePresenterToViewConformable? { get set }
    var router: ArticlePagePresenterToRouterConformable { get set }
    var interactor: ArticlePagePresenterToInteractorConformable { get set }

    //func didTapCell(with model: LaunchModel)
    func initialize()

}

// MARK: - Presenter --> View
protocol ArticlePagePresenterToViewConformable {
    //func onFetchLaunchListSucces()
}

// MARK: -VİEW OUTPUT - Presenter --> Interactor
protocol ArticlePagePresenterToInteractorConformable {
    var presenter: ArticlePageInteractorToPresenterConformable? { get set }
    //var launches: [LaunchModel] {get set}
    // func fetchLaunchList() eski versiyon
    // yenilnenen versityon
    //func fetchLaunchList() async
    
    
}

// MARK: - Interactor --> Presenter
protocol ArticlePageInteractorToPresenterConformable {
    //func fetchLaunchesListSucces (with launches: [LaunchModel])

}

// MARK: - Presenter --> Router
protocol ArticlePagePresenterToRouterConformable {
    func initialize()
    //func openTheDetailPage(with model: LaunchModel)
}






