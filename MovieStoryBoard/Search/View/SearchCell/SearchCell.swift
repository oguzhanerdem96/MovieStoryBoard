//
//  SearchCell.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import UIKit

class SearchCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchImageView.layer.cornerRadius = 16
        searchCellView.layer.cornerRadius = 16
    }


    func configureCell(item: ResultMovie) {
        self.movieTitle.text = item.title
        self.movieMinutes.text = item.release_date
        self.movieGenre.text = "\(item.vote_average ?? 7.8)"
        self.movieYear.text = item.original_language?.uppercased()
        let image = NetworkHelper.shared.baseImageUrl + item.poster_path!
        self.searchImageView.kf.setImage(with: URL(string: image))
    }
}
