//
//  WatchListVM.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation
protocol WatchListViewModelDelegate: AnyObject {
    func didGetMovies(isDone: Bool)
}


class WatchListVM {
    
    static let shared = WatchListVM()
    weak var delegate: WatchListViewModelDelegate?
    private init () { }
    
    var favoritesArray = [Favorites]()
    let coreDataHelper = CoreDataHelper()
    
    func fetchData() {
        favoritesArray = coreDataHelper.fetchData() ?? [Favorites]()
    }
}
