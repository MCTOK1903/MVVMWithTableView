//
//  TableViewViewModelType.swift
//  MVVM
//
//  Created by MCT on 6.10.2020.
//

import Foundation
import Alamofire

protocol TableViewViewModelType {
    func numberOfRowsInSection(section: Int) -> Int
    func cellForRowAt(indexPath: IndexPath) -> TableViewCellViewModelType
    
    func selectedRow(atIndexPath indexPath: IndexPath)
    func fetchMovie(completion: @escaping (AFResult<Codable>) ->Void)
    var resultsDidChange: (([Result]) -> Void)? { get set }
}
