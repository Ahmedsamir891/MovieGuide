//
//  Constants.swift
//  YayOrNay
//
//  Created by Mahmoud Fathy on 8/9/18.
//  Copyright © 2018 Mahmoud Fathy. All rights reserved.
//

import Foundation


enum Environment {
    case production
    
    var baseURL: String {
        switch self {
        case .production:
            return "https://api.themoviedb.org/3/"
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .production:
            return ["Content-Type": "application/json;charset=utf-8",
                    "Accept":"application/json"]
        }
    }
    
    var apiKey: String {
        switch self {
        case .production:
            return "ae61ede11d9885c3042cd8d070a3efc2"
        }
    }
    
    var imageBaseUrl: String {
        switch self {
        case .production:
            return "https://image.tmdb.org/t/p/w500"
        }
    }
}


struct EndPoints {
    
    //MARK: - base Url
    
    static let baseURL = Environment.production.baseURL
    
    
    // MARK: - Movie EndPoints
    static let MovieEndPoint = "movie"
    static let movieNowPlaying = "\(MovieEndPoint)/now_playing"
    static let movieDetails = "\(MovieEndPoint)/"
    
    static let rating = "\(MovieEndPoint)/movie_id/rating"

    // MARK: - Authentication EndPoints
    
    static let AuthenticationEndPoint = "authentication"
    static let guestSession = "\(AuthenticationEndPoint)/guest_session/new"
    
}
