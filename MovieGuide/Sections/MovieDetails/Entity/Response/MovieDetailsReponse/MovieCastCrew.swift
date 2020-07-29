//
//  MovieDetailsResponseCast.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 28, 2020

import Foundation

struct MovieCastCrew : Codable {
    
    let castId : Int?
    let character : String?
    let creditId : String?
    let gender : Int?
    let id : Int?
    let name : String?
    let order : Int?
    let profilePath : String?
    let department : String?
    let job : String?
    
    var profileImageUrl : String?{
        if let path = profilePath{
            return Environment.production.imageBaseUrl + path
        }
        else{
            return nil
        }
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case castId = "cast_id"
        case character = "character"
        case creditId = "credit_id"
        case gender = "gender"
        case id = "id"
        case name = "name"
        case order = "order"
        case profilePath = "profile_path"
        case job = "job"
        case department = "department"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        castId = try values.decodeIfPresent(Int.self, forKey: .castId)
        character = try values.decodeIfPresent(String.self, forKey: .character)
        creditId = try values.decodeIfPresent(String.self, forKey: .creditId)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        profilePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
        job = try values.decodeIfPresent(String.self, forKey: .job)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        
    }
    
}
