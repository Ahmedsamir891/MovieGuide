//
//  YallaCompareRouter.swift
//  House
//
//  Created by Faraz Haider on 17/11/2019.
//  Copyright © 2019 Ahmed samir ali. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case nowPlaying(page: Int)
    
    // MARK: - HTTPMethod
    
    private var method: HTTPMethod {
        switch self {
        case .nowPlaying:
            return .get
            
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
            
        }
        
        
        
    }
    
    
    // MARK: - Parameters
    
    var parameters: Parameters? {
        switch self {
        case .nowPlaying:
            return nil
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
        
        //        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
