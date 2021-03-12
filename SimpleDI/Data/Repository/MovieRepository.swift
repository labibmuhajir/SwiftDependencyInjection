//
//  MovieRepository.swift
//  SimpleDI
//
//  Created by Labib Muhajir on 11/03/21.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMovies(completion: @escaping (Movies?, Error?) -> Void)
}

class MovieRepository: MovieRepositoryProtocol {
    private let decoder: JSONDecoder
    private let popularMovie = "popular_movies.json"
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func getMovies(completion: @escaping (Movies?, Error?) -> Void) {
        do {
            guard let path = Bundle.main.path(forResource: "popular_movies", ofType: "json") else {
                completion(nil, nil)
                return
            }
            
            let jsonData = try String(contentsOfFile: path).data(using: .utf8)
            
            let result = try decoder.decode(Movies.self, from: jsonData!)
            completion(result, nil)
        } catch {
            completion(nil, error)
        }
    }
}
