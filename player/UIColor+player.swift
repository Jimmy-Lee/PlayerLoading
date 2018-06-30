//
//  UIColor+player.swift
//  player
//
//  Created by Prime on 6/30/18.
//  Copyright © 2018 prime. All rights reserved.
//

import UIKit

extension UIColor {
    open class var background: UIColor {
        get { return self.init(hex: 0xDDDDDD) }
    }

    open class var theme: UIColor {
        get { return self.init(hex: 0xFF6F69) }
    }

    convenience init(hex: UInt) {
        if hex > 0xFFFFFF {
            self.init(hex: 0xFFFFFF)
        } else {
            self.init(red: (hex>>16)&0xFF, green: (hex>>8)&0xFF, blue: hex&0xFF)
        }
    }

    convenience init(red: UInt, green: UInt, blue: UInt) {
        let red = min(0xFF, red)
        let green = min(0xFF, green)
        let blue = min(0xFF, blue)

        self.init(red: red, green: green, blue: blue, alpha: 0xFF)
    }

    convenience init(red: UInt, green: UInt, blue: UInt, alpha: UInt) {
        let CGFF = CGFloat(0xFF)

        let red = CGFloat(min(0xFF, red)) / CGFF
        let green = CGFloat(min(0xFF, green)) / CGFF
        let blue = CGFloat(min(0xFF, blue)) / CGFF
        let alpha = CGFloat(min(0xFF, alpha)) / CGFF

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
