//
//  CastVM.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

protocol CastDelegate: AnyObject {
    func didGetCast(isDone: Bool)
}


class CastVM {
    
    static let shared = CastVM()
    weak var delegate: CastDelegate?
    private init () { }

    var movieID: Int?
    var cast: [Cast] = []

    func getCast(complete: @escaping((String?)->())) {
        
        guard let id = CastVM.shared.movieID else { return }
        CastManager.shared.getCast(movieID: id) { [self] items, errorMessage in
            
            if let items = items {
                self.cast = items.cast!
                self.delegate?.didGetCast(isDone: true)
               
            }
            complete(errorMessage)
            self.delegate?.didGetCast(isDone: false)
           
        }
    }
}
