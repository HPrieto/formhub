//
//  UIImageView+Extensions.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/26/21.
//

import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

extension UIImage {
    
    static func get(fromUrlString urlString: String?, completionHandler completion: @escaping (UIImage?) -> Void) {
        guard
            let urlString: String = urlString,
            let url: URL = URL(string: urlString)
        else {
            completion(nil)
            return
        }
        if let cachedImage: UIImage = imageCache.object(forKey: urlString as NSString) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard
                    error == nil,
                    let data: Data = data,
                    let image: UIImage = UIImage(data: data)
                else {
                    completion(nil)
                    return
                }
                imageCache.setObject(image, forKey: urlString as NSString)
                completion(image)
            }
        }.resume()
    }
}

extension UIImageView {
    
    public func round(imageViewCorners corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func setTestImage() {
        setImage(fromUrlString: "https://i.pinimg.com/originals/88/c7/29/88c729e877cdfc06da1dd8149094e7fe.jpg")
    }
    
    func setTestEventImage() {
        setImage(fromUrlString: "https://i.insider.com/576bf03552bcd020008cb17b?width=1136&format=jpeg")
    }

    func setImage(fromUrlString urlString: String?) {

        UIImage.get(fromUrlString: urlString) { [weak self] (image) in
            guard
                let `self` = self,
                let image = image
            else {
                return
            }
            self.image = image
        }
    }
}
