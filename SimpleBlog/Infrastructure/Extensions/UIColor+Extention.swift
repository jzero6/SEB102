//
//  UIColor+Extention.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation
import UIKit

extension String {
    func color() -> UIColor? {
        switch(self){
        case "yellow":
            return UIColor.yellow
        case "darkBlue":
            return UIColor(red: 0.00, green: 0.15, blue: 0.39, alpha: 1.00)
        case "pink":
            return UIColor(red: 1.00, green: 0.00, blue: 0.41, alpha: 1.00)
        case "blue":
            return UIColor.blue
        case "orange":
            return UIColor.orange
        case "purple":
            return UIColor.purple
        default:
            return nil
        }
    }
}
