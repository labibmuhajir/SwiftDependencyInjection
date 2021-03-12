//
//  Movie.swift
//  SimpleDI
//
//  Created by Labib Muhajir on 11/03/21.
//

import Foundation

struct Movie: Codable, Equatable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int
    let adult: Bool
    let backdropPath: String
    let originalLanguage: String
    let originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case overview, title, id, adult, video, popularity
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}

typealias Movies = [Movie]
