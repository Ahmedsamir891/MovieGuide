//
//  MovieDetailsResponseBelongsToCollection.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 28, 2020

import Foundation

struct MovieBelongsToCollection : Codable {
    
    let backdropPath : String?
    let id : Int?
    let name : String?
    let posterPath : String?
    
    var moviePoster : String{
        return Environment.production.imageBaseUrl + posterPath.asStringOrEmpty()
    }
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id = "id"
        case name = "name"
        case posterPath = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
    }
    
}
