//
//  Episodes.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/12/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct Episodes: Codable {
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let image: EpisodesImageWrapper?
    let summary: String?
    var fixedSummary: String {
        let i = (summary?.replacingOccurrences(of: "<p>", with: ""))
        return i?.replacingOccurrences(of: "</p>", with: "") ?? ""
    }
    
   static func getSampleEpisodes() -> [Episodes]{
            guard let filePath = Bundle.main.path(forResource: "sampleEpisodes", ofType: "json") else {
                fatalError("ERROR: could not find path to JSON file, check for correct naming")
            }
            let url = URL(fileURLWithPath: filePath)
            do {
                let data = try Data(contentsOf: url)
                let episodeData = try JSONDecoder().decode([Episodes].self, from: data)
                return episodeData
            } catch {
                print(error)
                return []
            }
        }
    
}

struct EpisodesImageWrapper: Codable {
    let medium: String?
    let original: String?
}

