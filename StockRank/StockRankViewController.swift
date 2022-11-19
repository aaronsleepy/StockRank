//
//  ViewController.swift
//  StockRank
//
//  Created by Aaron on 2022/11/19.
//

import UIKit

class StockRankViewController: UIViewController {
    // 사용할 Data
    let stocks: [StockModel] = StockModel.list

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data 알려주기
        collectionView.dataSource = self
        // layout 알려주기
        collectionView.delegate = self
    }
}

// data + presentation(cell) 알려주기
extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stocks[indexPath.item]
        cell.configure(stock)
        return cell
    }
}

// layout 알려주기
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
