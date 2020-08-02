//
//  MovieGuideTests.swift
//  MovieGuideTests
//
//  Created by ahmed samir on 7/22/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import XCTest
@testable import MovieGuide

class MovieGuideTests: XCTestCase {
    
    let movieListServices =  MovieListServices()
    let movieDetailsServices =  MovieDetailsServices()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetMovieList(){
        
        let expectation = self.expectation(description: "movie")
        let page = 1
        
        movieListServices.getNowPlayingMovie(page: page, completionHandler: { (response) in
            
            XCTAssertNotNil(response)
            expectation.fulfill()
            
        }) { (error) in
            XCTAssertNil(error)
            XCTFail(error!.errorDescriptionEn.asStringOrEmpty())
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 120){ error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func testMovieDetails(){
        
        let expectation = self.expectation(description: "324668")
        let movieId = 324668 //324668 > movie id
        
        movieDetailsServices.getMovieDetailsById(movieId, completionHandler: { (response) in
            XCTAssertNotNil(response)
            XCTAssertEqual(response.id.asIntOrEmpty(), Int(324668))

            expectation.fulfill()
        }) { (error) in
            XCTAssertNil(error)
            XCTFail(error!.errorDescriptionEn.asStringOrEmpty())
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 120){ error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
