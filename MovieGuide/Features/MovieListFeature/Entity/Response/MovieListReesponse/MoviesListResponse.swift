//
//  MoviesListResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 24, 2020

import Foundation

struct MoviesListResponse : Codable {
    
    var dates : MoviesListDate?
    var page : Int?
    var results : [MoviesList]?
    var totalPages : Int?
    var totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dates =  try values.decodeIfPresent(MoviesListDate.self, forKey: .dates)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        //        results =  try values.decodeIfPresent([MoviesList].self, forKey: .results)
        results = try values.decodeIfPresent([MoviesList].self, forKey: .results)
        
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
    
    
    
    
    
}


