//
//  BottomCell.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 24.12.2022.
//

import UIKit
import Kingfisher

class BottomCell: UICollectionViewCell {
    @IBOutlet weak var bottomCellView: UIView!
    @IBOutlet weak var bottomCellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomCellView.layer.cornerRadius = 10
        bottomCellView.layer.shadowColor = UIColor.darkGray.cgColor
        bottomCellView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        bottomCellView.layer.shadowRadius = 4.0
        bottomCellView.layer.shadowOpacity = 0.4
        
        bottomCellImageView.layer.cornerRadius = 10
        bottomCellImageView.clipsToBounds = true
        
    }
    func configureCell(item: ResultMovie) {
        let image = NetworkHelper.shared.baseImageUrl + (item.poster_path ?? "")
        self.bottomCellImageView.kf.indicatorType = .activity
        self.bottomCellImageView.kf.setImage(with: URL(string: image))
    }

}
