//
//  LatestManager.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

class LatestManager {
    static let shared = LatestManager()
    

    func getLatest(page: Int, completion:@escaping ((Movie?, String?)->())) {
        let url = APIURLs.latestMovies(page: page)
        NetworkManager.shared.request(type: Movie.self, url: url, method: .get) { response in
            switch response {
            case .success(let items):
                completion(items, nil)
            case.failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
}
