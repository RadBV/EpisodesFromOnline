//
//  ShowsAPIClient.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/11/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

class ShowsAPIClient {
    private init() {}
    static let shared = ShowsAPIClient()
    
    func getShows(userInput: String?, completionHandler: @escaping (Result<[Shows],ErrorHandling>) -> Void ) {
        var urlStr = ""
        if let word = userInput {
            urlStr = "http://api.tvmaze.com/search/shows?q=\(word)"
        
            NetworkManager.shared.fetchData(urlStr: urlStr) { (result) in
                switch result {
                case .failure(let appError):
                    completionHandler(.failure(appError))
                case .success(let data):
                    do {
                        let showData = try JSONDecoder().decode([Shows].self, from: data)
                        completionHandler(.success(showData))
                    } catch {
                        completionHandler(.failure(ErrorHandling.decodingError))
                        print(error)
                    }
                }
            }
        }
    }
}

