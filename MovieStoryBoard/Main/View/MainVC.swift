//
//  MainVC.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 16.12.2022.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let topCell = "TopCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.latestCollectionView.alpha = 1
                self.popularCollectionView.alpha = 0
                self.upcomingCollectionView.alpha = 0
            })
        } else  if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.latestCollectionView.alpha = 0
                self.popularCollectionView.alpha = 1
                self.upcomingCollectionView.alpha = 0
            })
        } else  {
            UIView.animate(withDuration: 0.3, animations: {
                self.latestCollectionView.alpha = 0
                self.popularCollectionView.alpha = 0
                self.upcomingCollectionView.alpha = 1
            })
            
        }
    }
    

}
