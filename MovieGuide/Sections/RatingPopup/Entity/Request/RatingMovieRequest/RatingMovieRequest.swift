//
//  RatingMovieRequest.swift
//  Created on July 29, 2020

import Foundation

struct RatingMovieRequest : Codable {
    
    var value : Float?
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Float.self, forKey: .value)
    }
    
    init(value : Float) {
        self.value = value
    }
    
    
    
}

extension RatingMovieRequest {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
//extension RatingMovieRequest {
//    func asDictionary() throws -> [String: Any] {
//        let data = try JSONEncoder().encode(self)
//        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
//            throw NSError()
//        }
//        return dictionary
//    }
//}
