//
//  ReviewVM.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

protocol ReviewDelegate: AnyObject {
    func didGetReviews(isDone: Bool)
}


class ReviewVM {
    
    static let shared = ReviewVM()
    weak var delegate: ReviewDelegate?
    private init () { }

    var movieID: Int?
    var reviews: [ResultReview] = []

    func getReviews(complete: @escaping((String?)->())) {
        
        guard let id = ReviewVM.shared.movieID else { return }
        ReviewManager.shared.getReview(movieID: id) { [self] items, errorMessage in
            
            if let items = items {
                self.reviews = items.results!
                self.delegate?.didGetReviews(isDone: true)
               
            }
            complete(errorMessage)
            self.delegate?.didGetReviews(isDone: false)
           
        }
    }
}
