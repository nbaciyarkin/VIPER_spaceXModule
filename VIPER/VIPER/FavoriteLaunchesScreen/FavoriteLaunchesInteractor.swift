//
//  FavoriteLaunchesInteractor.swift
//  VIPER
//
//  Created by Hamdi Aktar on 14.06.2022.
//

import Foundation
import UIKit

class FavoriteLaunchesInteractor: FavoriteLaunchesPagePresenterToInteractorConformable {

    var favoriteLaunches: [RocketDataModel] = []
    
    var presenter: FavoriteLaunchesInteractorToPresenterConformable?
    
    init() {
        fetchSavedLaunchList()
    }
    
    func fetchSavedLaunchList() {
        DatapersistenceManager.shared.fetchingTitleItemFromDatabase { [weak self] result in
            switch result {
            case .success(let favorites):
                DispatchQueue.main.async {
                    self?.favoriteLaunches = favorites
                    print(favorites)
                    self?.presenter?.fetchLaunchesListSucces(with: favorites)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func DeleteLaunchItemFromStore(indexPath: IndexPath) {
        DatapersistenceManager.shared.deleteTitleWith(model: favoriteLaunches[indexPath.row]) { result in
            switch result {
            case .success():
                print("Data deleted from the database")
                //self.favoriteLaunches.remove(at: indexPath.row)
                //tableView.deleteRows(at: [indexPath], with: .left)
            case .failure(let error):
                print(error.localizedDescription)
            }
//            self.favoriteLaunches.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    
    
}

