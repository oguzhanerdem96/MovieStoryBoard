//
//  TopRatedVC.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 19.12.2022.
//

import UIKit

class TopRatedVC: UIViewController {

    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    
    let bottomCell = "BottomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
        topRatedCollectionView.register(.init(nibName: bottomCell, bundle: nil), forCellWithReuseIdentifier: bottomCell)
        TopRatedVM.shared.delegate = self
        TopRatedVM.shared.getTopRated{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
}

extension TopRatedVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TopRatedVM.shared.topRated.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCell, for: indexPath) as! BottomCell
        let item = TopRatedVM.shared.topRated[indexPath.row]
        cell.configureCell(item: item)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        DetailVM.shared.movieID = TopRatedVM.shared.topRated[indexPath.row].id
        AboutVC.detailAbout = TopRatedVM.shared.topRated[indexPath.row].overview
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
            
            TopRatedVM.shared.getTopRated{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
            }
            DispatchQueue.main.async {
                self.topRatedCollectionView.reloadData()
            }
        }
    }
}

extension TopRatedVC: TopRatedDelegate {
    func didGetTopRated(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.topRatedCollectionView.reloadData()
            }
        }
    }
}
