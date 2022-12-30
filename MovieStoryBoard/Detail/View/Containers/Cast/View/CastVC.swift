//
//  CastVC.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import UIKit

class CastVC: UIViewController {

    @IBOutlet weak var castCollectionView: UICollectionView!
    let castCell = "CastCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CastVM.shared.getCast{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
    
    private func setupUI() {
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.register(.init(nibName: castCell, bundle: nil), forCellWithReuseIdentifier: castCell)
        CastVM.shared.delegate = self
    }
    

}

extension CastVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CastVM.shared.cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: castCell, for: indexPath) as! CastCell
        let item = CastVM.shared.cast[indexPath.row]
        cell.configureCell(item: item)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4 , height: collectionView.frame.height / 2.3)
    }
    
}

extension CastVC: CastDelegate {
    func didGetCast(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.castCollectionView.reloadData()
            }
        }
    }
}
