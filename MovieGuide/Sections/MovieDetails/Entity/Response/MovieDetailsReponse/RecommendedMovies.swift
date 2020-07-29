//
//  MovieDetailsResponseRecommendation.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 28, 2020

import Foundation

struct RecommendedMovies : Codable {

        let page : Int?
        let results : [MoviesList]?
        let totalPages : Int?
        let totalResults : Int?

        enum CodingKeys: String, CodingKey {
                case page = "page"
                case results = "results"
                case totalPages = "total_pages"
                case totalResults = "total_results"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                page = try values.decodeIfPresent(Int.self, forKey: .page)
                results = try values.decodeIfPresent([MoviesList].self, forKey: .results)
                totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
                totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        }

}
