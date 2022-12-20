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
            UIView.animate(withDuration: 0.3) {
                
            }
        }
    }
    

}
