//
//  Shows.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/11/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct Shows: Codable {
    let score: Double?
    let show: ShowWRapper
}

struct ShowWRapper: Codable {
    let name: String
    let rating: Int
    let image: ImageWrapper
    let summary: String
    let id: Int
    
}

struct ImageWrapper: Codable {
    let medium: String
}
