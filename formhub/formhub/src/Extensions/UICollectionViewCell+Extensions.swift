//
//  UICollectionViewCell+Extensions.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import UIKit

extension UICollectionViewCell {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
