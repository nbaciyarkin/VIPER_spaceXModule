//
//  LikedButton.swift
//  VIPER
//
//  Created by Hamdi Aktar on 16.06.2022.
//

import Foundation
import UIKit

class MyButton: UIButton {
    var action: (() -> Void)?

    func whenButtonIsClicked(action: @escaping () -> Void) {
        self.action = action
        self.addTarget(self, action: #selector(MyButton.clicked), for: .touchUpInside)
    }

    // Button Event Handler:
    // I have not marked this as @IBAction because it is not intended to
    // be hooked up to Interface Builder
    @objc func clicked() {
        action?()
    }
}
