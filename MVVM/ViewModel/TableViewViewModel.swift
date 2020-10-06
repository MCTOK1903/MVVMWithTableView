//
//  TableViewViewModel.swift
//  MVVM
//
//  Created by MCT on 6.10.2020.
//

import Foundation
import Alamofire

class TableViewViewModel: TableViewViewModelType {
    
    // MARK:  Properties
    
    private var selectedIndexPath: IndexPath?
    
    var results: [Result] = [] {
        didSet {
            resultsDidChange?(results)
        }
    }
    
    var resultsDidChange: (([Result]) -> Void)?
    
    // MARK: Funcs
    func numberOfRowsInSection(section: Int) -> Int {
        return results.count
    }

    func cellForRowAt(indexPath: IndexPath) -> TableViewCellViewModelType {
        let result = results[indexPath.row]
        return CustomCellViewModel(movieResult: result)
    }

    func selectedRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func fetchMovie(completion: @escaping(AFResult<Codable>) -> Void) {
        
        NetworkService.shared.service(.get, url: UrlConstant.NOW_PLAYING_MOVIE, model: Movie.self) { [weak self] (responce) in
            
            switch responce {
            case .success(let movieModel):
                let movieResult = movieModel as! Movie
                self?.results = movieResult.results
            case .failure(let error):
                print("error: \(error)")
                break
            }
            
        }
    }
    
}

