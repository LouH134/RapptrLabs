//
//  UIImageView+.swift
//  Rapptr iOS Test
//
//  Created by Louis Harris on 3/24/22.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
  func loadRemoteImageFrom(urlString: String){
    let url = URL(string: urlString)
    image = nil
    //activityView.startAnimating()
    if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
        self.image = imageFromCache
        return
    }
    URLSession.shared.dataTask(with: url!) {
        data, response, error in
          if let response = data {
              DispatchQueue.main.async {
                if let imageToCache = UIImage(data: response) {
                    imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                    self.image = imageToCache
                }else{
                    self.loadRemoteImageFrom(urlString: "https://via.placeholder.com/300/000000/FFFFFF/?text=Image%20Not%20Found")
                }
              }
          }
     }.resume()
  }
}
