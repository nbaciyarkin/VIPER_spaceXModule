//
//  LaunchesPageProtocols.swift
//  VIPER
//
//  Created by Hamdi Aktar on 8.06.2022.
//
import Foundation
import UIKit

// MARK: -VİEW INPUT- View --> Presenter
protocol LaunchesPageViewToPresenterConformable {
    var view: LaunchesPagePresenterToViewConformable? { get set }
    var router: LaunchesPagePresenterToRouterConformable { get set }
    var interactor: LaunchesPagePresenterToInteractorConformable { get set }
    
    var launches: [LaunchModel] { get}

    func didTapCell(with model: LaunchModel, navController: UINavigationController)
    func didTapContextSaveButton(with model: LaunchModel)

    func initialize()
}

// MARK: - Presenter --> View
protocol LaunchesPagePresenterToViewConformable {
    func onFetchLaunchListSucces()
}

// MARK: -VİEW OUTPUT - Presenter --> Interactor
protocol LaunchesPagePresenterToInteractorConformable {
    var presenter: LaunchesPageInteractorToPresenterConformable? { get set }
    var launches: [LaunchModel] {get set}
   // func fetchLaunchList() eski versiyon
    // yenilnenen versiyon
    func fetchLaunchList()
    func SaveTheRocketItem(with launch: LaunchModel)
}

// MARK: - Interactor --> Presenter
protocol LaunchesPageInteractorToPresenterConformable {
    func fetchLaunchesListSucces (with launches: [LaunchModel])


}

// MARK: - Presenter --> Router
protocol LaunchesPagePresenterToRouterConformable {
    func initialize()
    var entry: EntryPoint? {get}
    func openTheDetailPage(with model: LaunchModel, navCV: UINavigationController)
  
}

protocol updateConform: AnyObject {
    
}

protocol LaunchesPageWorkerConformable {
    
}




