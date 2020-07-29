//
//  GuestSessionResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 29, 2020

import Foundation

struct GuestSessionResponse : Codable {

        let expiresAt : String?
        let guestSessionId : String?
        let success : Bool?

        enum CodingKeys: String, CodingKey {
                case expiresAt = "expires_at"
                case guestSessionId = "guest_session_id"
                case success = "success"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                expiresAt = try values.decodeIfPresent(String.self, forKey: .expiresAt)
                guestSessionId = try values.decodeIfPresent(String.self, forKey: .guestSessionId)
                success = try values.decodeIfPresent(Bool.self, forKey: .success)
        }

}
