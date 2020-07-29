//
//  RatingMovieResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 29, 2020

import Foundation

struct RatingMovieResponse : Codable {

        let statusCode : Int?
        let statusMessage : String?

        enum CodingKeys: String, CodingKey {
                case statusCode = "status_code"
                case statusMessage = "status_message"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
                statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage)
        }

}
