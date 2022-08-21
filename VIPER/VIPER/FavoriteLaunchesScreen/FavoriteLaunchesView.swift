//
//  FavoriteLaunchesView.swift
//  VIPER
//
//  Created by Hamdi Aktar on 14.06.2022.
//

import Foundation
import UIKit

class FavoriteLaunchesViewController: UIViewController {
    
    private var favoriteLaunches: [RocketDataModel] = []
    
    var presenter: FavoriteLaunchesViewControllerToPresenter?
    
    private let favoriteLaunchesTable: UITableView = {
        let table = UITableView()
        table.register(LaunchesTableViewCell.self, forCellReuseIdentifier: LaunchesTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.initialize()
        
        title = "Favorites"
        view.addSubview(favoriteLaunchesTable)
        
        favoriteLaunchesTable.dataSource = self
        favoriteLaunchesTable.delegate = self
        
        view.backgroundColor = .blue
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "downloaded"), object: nil, queue: nil) { _ in
            DispatchQueue.main.async {

                self.presenter?.interactor.fetchSavedLaunchList()
                print("current savedData mumber \(self.favoriteLaunches.count)")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favoriteLaunchesTable.frame = view.bounds
    }
}

extension FavoriteLaunchesViewController: FavoriteLaunchesPagePresenterToViewConformable {
    func onFetchSavedLaunchListSucces(with launches: [RocketDataModel]) {
        DispatchQueue.main.async {
            self.favoriteLaunches = launches
            print(self.favoriteLaunches.count)
            print("eleman store dan geldiiiiiiiiii")
            self.favoriteLaunchesTable.reloadData()
        }
    }
}

extension FavoriteLaunchesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteLaunches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.identifier, for: indexPath) as? LaunchesTableViewCell  else {
            return UITableViewCell()
        }
        let launch = favoriteLaunches[indexPath.row]
        print(launch)
        print("hey")
        
        let date = launch.date?.newStringFromat(str: launch.date)
        
        cell.configure(with: LaunchesViewModel(launchName: launch.name ?? "launch no name", image_link:launch.image_link ?? "https://images2.imgbox.com/4f/e3/I0lkuJ2e_o.png", date_local: date ?? "2012-10-08"))
        
        cell.setButtonFilled()
        cell.backgroundColor = UIColor(white: 0.2, alpha: 0.9)
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 2
        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return cell
    }
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            switch editingStyle {
            case.delete:
                presenter?.DeleteLaunchItem(indexPath: indexPath)
                self.favoriteLaunches.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
            default:
                break;
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let launch = favoriteLaunches[indexPath.row]
        guard let titleName = launch.name else {return}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
