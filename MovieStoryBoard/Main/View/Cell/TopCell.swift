//
//  TopCell.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 24.12.2022.
//

import UIKit
import Kingfisher

class TopCell: UICollectionViewCell {
    @IBOutlet weak var topCellView: UIView!
    @IBOutlet weak var topCellImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topCellView.layer.cornerRadius = 10
        topCellView.layer.shadowColor = UIColor(red: 0.08, green: 0.06, blue: 0.22, alpha: 1.00).cgColor
        topCellView.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        topCellView.layer.shadowRadius = 4.0
        topCellView.layer.shadowOpacity = 1
        topCellImageView.layer.cornerRadius = 16
        topCellImageView.clipsToBounds = true
    }

    func configureCell(item: ResultMovie) {
        self.movieLabel.text = item.title
        let image = NetworkHelper.shared.baseBackImageUrl + item.backdrop_path!
        self.topCellImageView.kf.setImage(with: URL(string: image))
        
    }
}
