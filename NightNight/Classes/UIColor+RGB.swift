//
//  UIColor+RGB.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

extension UIColor {
    convenience init(rgb: Int) {
        self.init(rgb: rgb, alpha: 1.0)
    }

    convenience init(rgb: Int, alpha: CGFloat) {
        let red = CGFloat(rgb >> 16) / 255.0
        let green = CGFloat(rgb >> 8 & 0xff) / 255.0
        let blue = CGFloat(rgb >> 0 & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hexString:String) {
        var targetStr = hexString
        if hexString.hasPrefix("#") {
            targetStr = String(hexString[hexString.index(after: hexString.startIndex)...])
        } else if hexString.hasPrefix("0x") {
            targetStr = String(hexString[hexString.index(hexString.startIndex, offsetBy: 2)...])
        }
        var hexRgb:Int32 = 0
        Scanner(string: targetStr).scanHexInt32(&hexRgb)
        let red = CGFloat(hexRgb >> 16) / 255.0
        let green = CGFloat(hexRgb >> 8 & 0xff) / 255.0
        let blue = CGFloat(hexRgb >> 0 & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
