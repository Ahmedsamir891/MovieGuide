//
//  MovieDetailsResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 28, 2020

import Foundation

struct MovieDetailsResponse : Codable {
    
    let adult : Bool?
    let backdropPath : String?
    let belongsToCollection : MovieBelongsToCollection?
    let budget : Int?
    let credits : MovieCredits?
    let genres : [MovieGenre]?
    let homepage : String?
    let id : Int?
    let imdbId : String?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Float?
    let posterPath : String?
    let productionCompanies : [MovieProductionCompany]?
    let productionCountries : [MovieProductionCountry]?
    let recommendations : MoviesListResponse?
    let releaseDate : String?
    let revenue : Int?
    let runtime : Int?
    let similar : MoviesListResponse?
    let spokenLanguages : [MovieSpokenLanguage]?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let voteAverage : Float?
    let voteCount : Int?
    
    var backDropPoster : String{
        return Environment.production.imageBaseUrl + backdropPath.asStringOrEmpty()
    }
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget = "budget"
        case credits = "credits"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case recommendations = "recommendations"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case similar = "similar"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        belongsToCollection = try MovieBelongsToCollection(from: decoder)
        budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        credits = try values.decodeIfPresent(MovieCredits.self, forKey: .credits)
        genres = try values.decodeIfPresent([MovieGenre].self, forKey: .genres)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        imdbId = try values.decodeIfPresent(String.self, forKey: .imdbId)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Float.self, forKey: .popularity)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        productionCompanies = try values.decodeIfPresent([MovieProductionCompany].self, forKey: .productionCompanies)
        productionCountries = try values.decodeIfPresent([MovieProductionCountry].self, forKey: .productionCountries)
        recommendations = try values.decodeIfPresent(MoviesListResponse.self, forKey: .recommendations)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        similar = try values.decodeIfPresent(MoviesListResponse.self, forKey: .similar)
        spokenLanguages = try values.decodeIfPresent([MovieSpokenLanguage].self, forKey: .spokenLanguages)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        voteAverage = try values.decodeIfPresent(Float.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
    
}
