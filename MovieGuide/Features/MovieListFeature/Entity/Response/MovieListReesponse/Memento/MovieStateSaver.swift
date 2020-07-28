//
//  MovieStateSaver.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/26/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation

struct MovieStateSaver {
    var moviesList : [MoviesList]?
    
    public static func saveMovie(_ movie : MoviesList){
        if let movies = getMovies(), !movies.isEmpty{
            var list = [MoviesList]()
            list = movies
             list.append(movie)
            UserDefaults.standard.set(try! PropertyListEncoder().encode(list), forKey: "movies")

        }
        else{
            var moviesList = [MoviesList]()
            moviesList.append(movie)
            UserDefaults.standard.set(try! PropertyListEncoder().encode(moviesList), forKey: "movies")

        }
        

//        let savedMovies = try! PropertyListEncoder().encode(moviesList)
//        UserDefaults.standard.set(savedMovies, forKey: "movies")
    }
    
    public static  func getSelectedMovie() -> [MoviesList]?{
          if let movies = UserDefaults.standard.data(forKey: "movies"){
              return try! PropertyListDecoder().decode([MoviesList].self, from: movies)
          }
          return nil
      }
    
    public static  func getMovies() -> [MoviesList]?{
        if let movies = UserDefaults.standard.data(forKey: "movies"){
            return try! PropertyListDecoder().decode([MoviesList].self, from: movies)
        }
        return nil
    }
    
    public static  func removeMovie(_ movie : MoviesList){
        if let movies = UserDefaults.standard.data(forKey: "movies"){
            let movieList = try! PropertyListDecoder().decode([MoviesList].self, from: movies)
            
            let updateMoviesList = movieList.filter{ $0.id != movie.id }
            
            let savedMovies = try! PropertyListEncoder().encode(updateMoviesList)
            UserDefaults.standard.set(savedMovies, forKey: "movies")
            
        }
    }
    
    public static func removeAllMovies(){
        UserDefaults.standard.removeObject(forKey: "movie")
    }
}
