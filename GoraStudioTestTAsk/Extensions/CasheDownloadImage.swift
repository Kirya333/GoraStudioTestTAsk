//
//  CasheDownloadImage.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 07.10.2021.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func downloadImage(from url: URL, completion: @escaping (Error?) -> Void) {
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: url as AnyObject) {
            
            DispatchQueue.main.async {
                self.image = cachedImage as? UIImage
                completion(nil)
            }
            return
        }
        
        APIWorker.shared.fetchData(from: url) {
            (data, response, error) in
            
            if let error = error {
                completion(error)
            }
            
            if let response = response as? HTTPURLResponse,
            response.statusCode == 200,
            let data = data {
                guard let downloadedImage = UIImage(data: data) else { return }
                imageCache.setObject(downloadedImage, forKey: url as AnyObject)
                
                DispatchQueue.main.async {
                    self.image = downloadedImage
                    completion(nil)
                }
            }
        }
    }
}
