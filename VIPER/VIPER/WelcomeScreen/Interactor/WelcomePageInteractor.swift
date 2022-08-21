//
//  WelcomePageInteractor.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation


class WelcomePageInteractor: WelcomePagePresenterToInteractorConformable {
    var launches: [LaunchModel] = []

    
    weak var presenter: WelcomePageInteractorToPresenterConformable?
}


