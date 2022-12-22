//
//  NetworkHelper.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

enum HtppMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String , Error {
    case invalidData = "invalid Data"
    case invalidUrl = "invalid URL"
    case generalError = "an error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    let baseURL = "https://api.themoviedb.org/3/movie/"
    let apiKey = "0c3c30821942c1012a6fd0366d2aaf13"
    let baseImageUrl = "https://image.tmdb.org/t/p/w200"
    let baseBackImageUrl = "https://image.tmdb.org/t/p/w500"
}

let apiKey = "0c3c30821942c1012a6fd0366d2aaf13"

enum APIURLs {
    static func popularMovies(page: Int) -> String {
    "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    static func topRatedMovies(page: Int) -> String {
    "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    
    static func latestMovies(page: Int) -> String {
      "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    
    static func upcomingMovies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    
    static func review(movieID: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(movieID)/reviews?api_key=\(apiKey)&language=en-US&page=1"
    }
    
    static func movieDetail(movieID: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)&language=en-US"
    }
    
    static func cast(movieID: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(apiKey)&language=en-US"
    }
    
}
