//
//  Shows.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/11/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct ShowWrapper: Codable {
    let show: Shows    
}

struct Shows: Codable {
    let name: String
    let rating: RatingWrapper?
    let image: ImageWrapper?
    let summary: String
    let id: Int
    
    static func getSampleShows() -> [Shows] {
        guard let filePath = Bundle.main.path(forResource: "sampleShows", ofType: "json") else {
            fatalError("ERROR: could not find path to JSON file, check for correct naming")
        }
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url)
            let showData = try JSONDecoder().decode([ShowWrapper].self, from: data)
            let showsResult = showData.map { (ShowWrapper) -> Shows in
                return ShowWrapper.show
            }
            return showsResult
        } catch {
            print(error)
            return []
        }
    }
}

struct RatingWrapper: Codable {
    let average: Double?
}
struct ImageWrapper: Codable {
    let medium: String?
}
