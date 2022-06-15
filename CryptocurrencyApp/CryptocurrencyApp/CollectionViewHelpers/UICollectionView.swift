//
//  UICollectionView.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 15.06.22.
//

import Foundation
import UIKit

extension UICollectionView {
   public func register(cellType: UICollectionViewCell.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    public func dequeCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("Hata meydana geldi")
        }
        return cell
    }
}
