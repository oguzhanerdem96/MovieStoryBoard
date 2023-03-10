//
//  PopularVC.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 19.12.2022.
//

import UIKit

class PopularVC: UIViewController {
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    let bottomCell = "BottomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(.init(nibName: bottomCell, bundle: nil), forCellWithReuseIdentifier: bottomCell)
        PopularVM.shared.delegate = self
        PopularVM.shared.getPopular{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
    
}

extension PopularVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PopularVM.shared.popular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCell, for: indexPath) as! BottomCell
        let item = PopularVM.shared.popular[indexPath.row]
        cell.configureCell(item: item)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        DetailVM.shared.movieID = PopularVM.shared.popular[indexPath.row].id
        AboutVC.detailAbout = PopularVM.shared.popular[indexPath.row].overview
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width + 60 ) / 4 , height: (collectionView.frame.height + 40) / 2.5)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - (4 * height) {
            PopularVM.shared.getPopular{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
                DispatchQueue.main.async {
                    self.popularCollectionView.reloadData()
                }
            }
        }
    }
}

extension PopularVC: PopularDelegate {
    func didGetPopular(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.popularCollectionView.reloadData()
            }
        }
    }
}
