//
//  MainVC.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 16.12.2022.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var latesCollectionView: UIView!
    @IBOutlet weak var popularCollectionView: UIView!
    @IBOutlet weak var topRatedCollectionView: UIView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let topCell = "TopCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.85, green: 0.84, blue: 0.91, alpha: 1.00)], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        self.popularCollectionView.alpha = 0
        self.topRatedCollectionView.alpha = 0
        self.view.addSubview(topCollectionView)
        topCollectionView.register(.init(nibName: topCell, bundle: nil), forCellWithReuseIdentifier: topCell)
    }
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
    
    }
    

}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
