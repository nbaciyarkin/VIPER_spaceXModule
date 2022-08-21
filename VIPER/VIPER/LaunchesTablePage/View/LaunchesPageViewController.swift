//
//  LaunchesViewController.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import UIKit

class LaunchesPageViewController: UIViewController {
    
    var presenter: LaunchesPageViewToPresenterConformable?
    
     var launches: [LaunchModel] = []
    
    private let launchesTable: UITableView = {
        let table = UITableView()
        table.register(LaunchesTableViewCell.self, forCellReuseIdentifier: LaunchesTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Kullanmadım!!!
        presenter?.initialize()
        print(launches.count)
        title = "Launches"
        view.backgroundColor = .cyan
        view.addSubview(launchesTable)
        launchesTable.dataSource = self
        launchesTable.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        launchesTable.frame = view.bounds
    }
}

extension LaunchesPageViewController: LaunchesPagePresenterToViewConformable {    
    func onFetchLaunchListSucces() {
        // reload table view
        DispatchQueue.main.async {
            self.launches = self.presenter?.launches ?? []
            print(self.launches.count)
            self.launchesTable.reloadData()
        }
    }
}


extension LaunchesPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.identifier, for: indexPath) as? LaunchesTableViewCell  else {
            return UITableViewCell()
        }
 
        let launch = launches[indexPath.row]
        let date = launch.date_local?.newStringFromat(str: launch.date_local!)
        
        cell.configure(with: LaunchesViewModel(launchName: launch.name ?? "no name ", image_link: launch.links?.patch?.small ?? "https://images2.imgbox.com/4f/e3/I0lkuJ2e_o.png" , date_local: date ?? "no date"))
        cell.backgroundColor = UIColor(white: 0.3, alpha: 0.2)
        cell.layer.cornerRadius = 40
        cell.layer.borderWidth = 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] _ in
            let downloadAction = UIAction(title: "Add Favorites", image: UIImage(systemName: "arrow.clockwise.heart.fill"), identifier: nil, discoverabilityTitle: nil, state:.off)
            { _ in
                print("download tapped")
                self?.presenter?.didTapContextSaveButton(with: (self?.launches[indexPath.row])!)
            }
            return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [downloadAction])
        }
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let launch = launches[indexPath.row]
        guard let launchName = launch.name else {return}
        print(launchName)
        presenter?.didTapCell(with: launch, navController: navigationController ?? UINavigationController())
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
}
