//
//  ImageHelper.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 10/9/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    
    private init() {}
    
    static let shared = ImageHelper()
    
    func getImage(urlStr: String, completionHandler: @escaping (Result<UIImage, ErrorHandling>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(.networkError))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.other("Not an image")))
                return
            }
            completionHandler(.success(image))
            
            }.resume()
    }
    
}
