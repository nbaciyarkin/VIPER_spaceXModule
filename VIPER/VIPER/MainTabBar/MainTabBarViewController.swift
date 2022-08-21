//
//  MainTabBarViewController.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import UIKit
class MainTabBarController: UITabBarController {
    
    
    
    let btn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .orange
        
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let vc1 = UINavigationController(rootViewController: LaunchesPageRouter.createModule())
        
        
        view.addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        btn.centerYAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
      
        tabBar.addSubview(btn)

        
        // MARK: - START WITH TABLE VIEW SCENARIO
        let vc1 = UINavigationController(rootViewController: LaunchesPageRouter.createModule())
        let vc2 = UINavigationController(rootViewController: FavoriteLaunchesPageRouter.createModule())
        
        vc1.title = "Launches"
        //vc2.title = "Favorites"
        vc1.tabBarItem.image = UIImage(systemName: "arrow.down.forward.and.arrow.up.backward.circle.fill")
        vc2.tabBarItem.image = UIImage(systemName: "arrow.down.circle.fill")
        
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
        
        tabBar.tintColor = UIColor(named: "selected")
        UITabBar.appearance().unselectedItemTintColor = .gray
        setViewControllers([vc1,vc2], animated: true)
    }
}
