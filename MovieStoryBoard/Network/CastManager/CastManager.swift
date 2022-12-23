//
//  CastManager.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

class CastManager {
    static let shared = CastManager()
    
    func getCast(movieID: Int, completion: @escaping ((MovieCast?, String?)->())) {
        
        let url = APIURLs.cast(movieID: movieID)
        NetworkManager.shared.request(type: MovieCast.self, url: url, method: .get) { response in
            switch response {
            case .success(let items):
                completion(items, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
        
    }
}
