//
//  SimpleDITests.swift
//  SimpleDITests
//
//  Created by Labib Muhajir on 11/03/21.
//

import XCTest
@testable import SimpleDI

class SimpleDITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        DIContainer.register(resolver: JSONDecoder())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DIContainer.clear()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let repo = MovieRepository(decoder: DIContainer.resolve())
        let expected = Movie(popularity: 367.019, voteCount: 426, video: false, posterPath: "/qdfARIhgpgZOBh3vfNhWS4hmSo3.jpg", id: 330457, adult: false, backdropPath: "/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg", originalLanguage: "en", originalTitle: "Frozen II", genreIDS: [12,16,35,10402,10751], title: "Frozen II", voteAverage: 7, overview: "Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.", releaseDate: "2019-11-20")
        
        repo.getMovies { (movie, error) in
            XCTAssertNotNil(movie, "nil result")
            XCTAssertEqual(movie!.first, expected)
        }
    }

}
