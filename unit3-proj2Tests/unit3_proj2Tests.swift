//
//  unit3_proj2Tests.swift
//  unit3-proj2Tests
//
//  Created by Radharani Ribas-Valongo on 9/11/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import XCTest
@testable import unit3_proj2

class unit3_proj2Tests: XCTestCase {

    func testShows() {
        let shows = Shows.getSampleShows()
        XCTAssert(shows.count > 0, "we got shows: \(shows.count)")
    }
    
    func testEpisodes() {
        
    }
    
}
