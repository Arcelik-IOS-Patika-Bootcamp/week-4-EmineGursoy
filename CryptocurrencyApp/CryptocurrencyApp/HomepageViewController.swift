//
//  HomepageViewController.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 08.06.22.
//

import UIKit

class HomepageViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 5, bottom: 10, right: 5)
    }
    
    private func setUpUI(){
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        collectionView.backgroundColor = .darkGray
    }
}

extension HomepageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

extension HomepageViewController: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width - 20, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    
}
