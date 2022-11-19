//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by Aaron on 2022/11/19.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var companyDiffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertCurrencyFormat(stock.price))원"
        companyDiffLabel.text = "\(stock.diff)%"
        companyDiffLabel.textColor = converColorByDiff(stock.diff)
    }
    
    func converColorByDiff(_ diff: Double) -> UIColor {
        let color: UIColor
        if diff > 0 {
            color = UIColor.systemRed
        } else {
            color = UIColor.systemBlue
        }
        
        return color
    }
    
    func convertCurrencyFormat(_ price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        
        return result
    }

}
