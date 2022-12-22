//
//  DetailManager.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

class DetailManager {
     static let shared = DetailManager()
    
    func getDetail(movieID: Int, completion: @escaping ((MovieDetail?, String?)->())) {
        let url = APIURLs.movieDetail(movieID: movieID)
        
        NetworkManager.shared.request(type: MovieDetail.self, url: url, method: .get) { response in
            switch response {
            case .success(let items):
                completion(items, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
}
