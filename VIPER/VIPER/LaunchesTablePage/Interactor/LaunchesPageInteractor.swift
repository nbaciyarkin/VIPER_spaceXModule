//
//  LaunchesPageInteractor.swift
//  VIPER
//
//  Created by Hamdi Aktar on 8.06.2022.
//

import Foundation
class LaunchesPageInteractor: LaunchesPagePresenterToInteractorConformable {
    
    var presenter: LaunchesPageInteractorToPresenterConformable?
    var launches: [LaunchModel] = []
    
    init()  {
        fetchLaunchList()
    }
    
    func SaveTheRocketItem(with launch: LaunchModel) {
        DatapersistenceManager.shared.saveRocket(model: launch) { result in
            switch result{
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("downloaded"), object: nil)
                print("!! SUCESFUL DOWNLOAD!!!")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func fetchLaunchList(){
        ApiCaller.shared.getAllLaunches {[weak self] result in
            switch result {
            case .success(let launchesData):
                DispatchQueue.main.async {
                    self?.launches = launchesData
//                   print(self?.launches.count)
                    self?.presenter?.fetchLaunchesListSucces(with: launchesData)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}






