//
//  HomeScreen.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 15.06.22.
//

import UIKit

class HomeScreen: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var cryptosCollectionView: UICollectionView!
    
    var viewModel: HomeScreenViewModel! {
        didSet{
            viewModel.delegate = self
        }
    }
    var filteredCryptos = [CryptoCurrency]()
    var isFiltering : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptosCollectionView.dataSource = self
        cryptosCollectionView.delegate = self
        cryptosCollectionView.register(cellType: CollectionViewCell.self)
        cryptosCollectionView.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        setUpUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadCryptos()
    }
    
    private func setUpUI(){
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        cryptosCollectionView.backgroundColor = .darkGray
    }

}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering{
            return filteredCryptos.count
        }else {
            return viewModel.numberOfItem
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cryptosCollectionView.dequeCell(cellType: CollectionViewCell.self, indexPath: indexPath)
        
        if isFiltering {
            let crypto = filteredCryptos[indexPath.row]
            cell.cellConfigure(crypto: crypto)
        }else {
            if let crypto = viewModel.crypto(index: indexPath.row){
                cell.cellConfigure(crypto: crypto)
            }
        }
        
        
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width - 20, height: 100)
        
    }
    
    
}

extension HomeScreen: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            filteredCryptos.removeAll()
            isFiltering = false
            cryptosCollectionView.reloadData()
        }else {
            filteredCryptos = viewModel.allCryptos.filter({(crypto: CryptoCurrency) -> Bool in
                return crypto.name.lowercased().contains(searchText.lowercased())
            })
            
            isFiltering = true
            cryptosCollectionView.reloadData()
        }
    }
}


extension HomeScreen: HomeScreenViewModelDelegate{
    func reloadData() {
        cryptosCollectionView.reloadData()
    }
}
