//
//  KFImageExtension.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImageWithKF(_ imageUrl: String, placeHolder: String) {
        self.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: placeHolder))
    }
}
