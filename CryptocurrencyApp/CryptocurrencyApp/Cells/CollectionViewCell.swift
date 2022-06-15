//
//  CollectionViewCell.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 09.06.22.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    var onLikeButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(){
        containerView.backgroundColor = .white
    }
    func cellConfigure(crypto: CryptoCurrency ){
        codeLabel.text = crypto.id
        nameLabel.text = crypto.name
        priceLabel.text = crypto.price
        preprePosterImage(with: crypto.logo_url)
        
    }
    private func preprePosterImage(with urlString: String?) {
        guard let stringUrl = urlString else {return}
        
        let url = URL(string: stringUrl)
        img.kf.setImage(with: url)
        
    }
    
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        onLikeButtonTapped?()
    }
}
