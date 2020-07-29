//
//  MovieDetailsResponseCredit.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 28, 2020

import Foundation

struct MovieCredits : Codable {
    
    let cast : [MovieCastCrew]?
    let crew : [MovieCastCrew]?
    
    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cast = try values.decodeIfPresent([MovieCastCrew].self, forKey: .cast)
        crew = try values.decodeIfPresent([MovieCastCrew].self, forKey: .crew)
    }
    
}
