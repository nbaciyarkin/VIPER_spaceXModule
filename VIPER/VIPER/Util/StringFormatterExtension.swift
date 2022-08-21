//
//  StringExtension.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation
import UIKit

extension String {
    func newStringFromat(str: String?) -> String {
        var counter = 0
        var newStr = ""
        
         for i in str!  {
             newStr.append(i)
                counter += 1
                if counter == 10 {
                    break
                }
            }
         return newStr
    }
}
