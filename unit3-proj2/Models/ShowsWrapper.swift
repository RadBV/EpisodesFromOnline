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
    
}

struct RatingWrapper: Codable {
    let average: Double?
}
struct ImageWrapper: Codable {
    let medium: String?
}
