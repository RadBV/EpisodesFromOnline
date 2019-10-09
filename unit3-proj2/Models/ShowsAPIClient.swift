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
        
        var urlStr: String {
            
            guard let word = userInput else {
                return "http://api.tvmaze.com/search/shows?q=girls"
            }
            guard word != "" else {
                return "http://api.tvmaze.com/search/shows?q=girls"
            }
            return "http://api.tvmaze.com/search/shows?q=\(word)"
        }
        
            NetworkManager.shared.fetchData(urlStr: urlStr) { (result) in
                switch result {
                case .failure(let appError):
                    completionHandler(.failure(appError))
                case .success(let data):
                    do {
                        let showWrapperData = try JSONDecoder().decode([ShowWrapper].self, from: data)
                        let showData = showWrapperData.map { (ShowWrapper) -> Shows in
                            return ShowWrapper.show
                        }
                        completionHandler(.success(showData))
                    } catch {
                        completionHandler(.failure(ErrorHandling.decodingError))
                        print(error)
                    }
                }
            }
        }
}

