//
//  ReviewManager.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

class ReviewManager {
    static let shared = ReviewManager()
    
    func getReview(movieID: Int, completion: @escaping ((Review? , String?)->())) {
        let url = APIURLs.review(movieID: movieID)
        
        NetworkManager.shared.request(type: Review.self, url: url, method: .get) { response in
            switch response {
            case .success(let items):
                completion(items, nil)
            case .failure(let error):
                completion(nil, error.rawValue )
            }
        }
    }
}
