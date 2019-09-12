//
//  EpisodeAPIClient.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/12/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

class EpisodesAPIClient {
    private init() {}
    static let shared = EpisodesAPIClient()
    
    func getEpisodes(id: Int, completionHandler: @escaping (Result<[Episodes],ErrorHandling>) -> Void ) {
        let urlStr = "http://api.tvmaze.com/shows/\(id)/episodes"
        NetworkManager.shared.fetchData(urlStr: urlStr) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let EpisodeData = try JSONDecoder().decode([Episodes].self, from: data)
                    completionHandler(.success(EpisodeData))
                } catch {
                    completionHandler(.failure(ErrorHandling.decodingError))
                }
            }
        }
    }
}
