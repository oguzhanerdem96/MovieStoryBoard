//
//  MainVM.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 20.12.2022.
//

import Foundation

protocol MainVMDelegate: AnyObject {
    func didGetTopRated(isDone: Bool )
}

class MainVM {
    weak var delegate: MainVMDelegate?
    static let shared = MainVM()
    private init(){}
    
    var topRated: [ResultMovie] = []
    private var page: Int = 1
    
    func getTopRated(completion: @escaping ((String?)->())) {
        TopRatedManager.shared.getTopRated(page: page) { items, errorMessage in
            if let items = items {
                self.topRated.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetTopRated(isDone: false)
            }
            completion(errorMessage)
            self.delegate?.didGetTopRated(isDone: false)
        }
    }
}
