//
//  ReviewCell.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var reviewImageVİew: UIImageView!
    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var reviewDetail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewImageVİew.layer.cornerRadius = 6
        reviewView.layer.borderColor = UIColor.lightGray.cgColor
        reviewView.layer.borderWidth = 0.3
        reviewView.layer.cornerRadius = 16
        reviewView.backgroundColor = .clear
    }

    func configureCell(item: ResultReview) {
        self.reviewTitle.text = item.author?.uppercased()
        self.reviewDetail.text = item.content
        self.reviewImageVİew.image = UIImage(named: "car6")
    }
}
