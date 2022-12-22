//
//  UpcomingManager.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

class UpcomingManager {
    static let shared = UpcomingManager()
    
    func getUpComing(page: Int, completion: @escaping ((Movie?, String?)->())) {
        
        let url = APIURLs.upcomingMovies(page: page)
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
