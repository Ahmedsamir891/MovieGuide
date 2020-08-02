//
//  YallaCompareRouter.swift
//  House
//
//  Created by Faraz Haider on 17/11/2019.
//  Copyright © 2019 Ahmed samir ali. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
enum APIRouter: URLRequestConvertible {
    case nowPlaying(page: Int)
    case movieDetails(movieId: Int, movieMoreDetails:String)
    case createGuestSession
    
    case rateMovie(movieId: Int, sessionId:String, value: Float)
    
    // MARK: - HTTPMethod
    
    private var method: HTTPMethod {
        switch self {
        case .nowPlaying:
            return .get
            
        case .movieDetails:
            return .get
            
        case .createGuestSession:
            return .get
            
        case .rateMovie:
            return .post
            
        }
    }
    
    // MARK: - Parameters
    
    var parameters: Parameters? {
        switch self {
        case .nowPlaying:
            return nil
        case .movieDetails:
            return nil
        case .createGuestSession:
            return nil
        case .rateMovie(_, _, let value):
            return RatingMovieRequest(value: value).dictionary
        }
    }
    
    
    // MARK: - Path
    var url : URL {
        switch self {
        case .nowPlaying(let page):
            
            var urlComponents = URLComponents(string: Environment.production.baseURL + EndPoints.movieNowPlaying)!
            urlComponents.queryItems = [
                URLQueryItem(name: "api_key", value: Environment.production.apiKey),
                URLQueryItem(name: "language", value:"en-US"),
                URLQueryItem(name: "page", value:"\(page)")
            ]
            return urlComponents.url!
            
            
        case .movieDetails(let movieId, let movieMoreDetails):
            
            var urlComponents = URLComponents(string: Environment.production.baseURL + EndPoints.movieDetails + "\(movieId)")!
            urlComponents.queryItems = [
                URLQueryItem(name: "api_key", value: Environment.production.apiKey),
                URLQueryItem(name: "language", value:"en-US"),
                URLQueryItem(name: "append_to_response", value:movieMoreDetails)
                
            ]
            return urlComponents.url!
            
        case .createGuestSession:
            
            var urlComponents = URLComponents(string: Environment.production.baseURL + EndPoints.guestSession)!
            urlComponents.queryItems = [
                URLQueryItem(name: "api_key", value: Environment.production.apiKey)
            ]
            return urlComponents.url!
            
        case .rateMovie(let movieId,let sessionId, _):
            
            var urlComponents = URLComponents(string: Environment.production.baseURL + EndPoints.MovieEndPoint + "/\(movieId)/rating")!
            urlComponents.queryItems = [
                URLQueryItem(name: "api_key", value: Environment.production.apiKey),
                URLQueryItem(name: "guest_session_id", value: sessionId)
            ]
            return urlComponents.url!
            
        }
        
    }
    
    
    var encoding : ParameterEncoding {
        switch self {
        default :
            return JSONEncoding.default
        }
    }
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.allHTTPHeaderFields = Environment.production.headers
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}
