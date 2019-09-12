//
//  ErrorHandling.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/11/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

enum ErrorHandling: Error {
    case badURL
    case decodingError
    case noData
    case networkError
    case badHTTPResponse
    case notFound
    case unauthorized
    case other(String)
}
