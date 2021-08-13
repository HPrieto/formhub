//
//  UIColor+Extensions.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/30/21.
//

import UIKit

extension UIColor {
    
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }

    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

    convenience init(netHex:Int, alpha: CGFloat = 1.0) {
        self.init(
            red:(netHex >> 16) & 0xff,
            green:(netHex >> 8) & 0xff,
            blue:netHex & 0xff,
            alpha: alpha
        )
    }
    
    public static let darkerGray: UIColor = UIColor(netHex: 0x222)
    public static let darkGray: UIColor = UIColor(netHex: 0x717171)
    public static let gray: UIColor = UIColor(netHex: 0xb0b0b0)
    public static let lightGray: UIColor = UIColor(netHex: 0xDDDDDD)
    public static let lighterGray: UIColor = UIColor(netHex: 0xebebeb)
    public static let accentGray: UIColor = UIColor(netHex: 0xf7f7f7)
    
    public static let red: UIColor = UIColor(netHex: 0xff385c)
    public static let orange: UIColor = UIColor(netHex: 0xe07912)
    public static let green: UIColor = UIColor(netHex: 0x008a05)
    public static let blue: UIColor = UIColor(netHex: 0x428bff)
    public static let purple: UIColor = UIColor(netHex: 0x92174d)
    public static let violet: UIColor = UIColor(netHex: 0x460479)
    
    public static let primaryBorder: UIColor = gray
}
