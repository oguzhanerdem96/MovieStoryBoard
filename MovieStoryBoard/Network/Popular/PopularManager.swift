//
//  PopularManager.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

class PopularManager {
    static let shared = PopularManager()
    
    func getPopular(page: Int, completion: @escaping ((Movie?, String?)->())) {
        let url = APIURLs.popularMovies(page: page)
        
        NetworkManager.shared.request(type: Movie.self, url: url
                                      , method: .get) { response in
            switch response {
            case .success(let items):
                    completion(items, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
}
