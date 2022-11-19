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

extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    
}
