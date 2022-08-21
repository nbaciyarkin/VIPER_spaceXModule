//
//  WelcomeViewController.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    var presenter: WelcomeViewControllerToPresenter?
    
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        
        button.setTitle("SHOW LAUNCHES", for: .normal)
        button.addTarget(self, action: #selector(btn_TUI), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.initialize()
        view.addSubview(downloadButton)
        view.backgroundColor = .green
        configureConstraints()
    }
    
    @objc func btn_TUI(){
        print("button pressed")
        print("BTN: Hey presenter call the didtapButton")
        presenter?.didTapOpenButton(navigationController: navigationController ?? UINavigationController())
    }
    

    private func configureConstraints(){
        
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 300),
            downloadButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
}

extension WelcomeViewController: WelcomePagePresenterToViewConformable {
    func didTapOpenButton(navigationController: UINavigationController) {
        print("VİEW: hey presenter call the didtapOpenbUTTON")
        presenter?.didTapOpenButton(navigationController: navigationController)
    }
    
}




