//
//  CollectionViewCell.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 09.06.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cryptocurrencyButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(){
        self.containerView.backgroundColor = .white
        //Button configured
        cryptocurrencyButton.tintColor = .black
        cryptocurrencyButton.backgroundColor = .cyan
        cryptocurrencyButton.setTitle("cryptocurrency", for: .normal)
        cryptocurrencyButton.layer.cornerRadius = 20
        cryptocurrencyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        likeButton.tintColor = .red
        
    }
    
    @IBAction func cryptocurrencyButtonClicked(_ sender: Any) {
    }
    @IBAction func likeButtonClicked(_ sender: Any) {
    }
}
