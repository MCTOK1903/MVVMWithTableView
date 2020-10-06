//
//  Constants.swift
//  MVVM
//
//  Created by MCT on 6.10.2020.
//

import Foundation

class UrlConstant {
    
    // MARK: - KEY
    
    private static let KEY = "fc6fbc3ee72d36c19e1752a6ee0f6273"
    static let API_KEY = "?api_key=" + KEY
    
    // MARK: - Movie
    
    static let MOVIE_URL = "https://api.themoviedb.org/3/movie/"
    static let NOW_PLAYING_MOVIE = MOVIE_URL + "now_playing" + API_KEY
    
}
