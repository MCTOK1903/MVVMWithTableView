//
//  CustomCellViewModel.swift
//  MVVM
//
//  Created by MCT on 6.10.2020.
//

import Foundation


class CustomCellViewModel: TableViewCellViewModelType {
    
    // MARK: Properties
    
    private var movieResult: Result
    private var selectedIndexPath: IndexPath!
    
    var movieName: String {
        return movieResult.title
    }
    
    var movieVote: Int {
        return movieResult.vote_count
    }
    
    // MARK: LifeCycle
    
    init(movieResult: Result) {
        self.movieResult = movieResult
    }
}
