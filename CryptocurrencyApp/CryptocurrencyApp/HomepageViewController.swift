//
//  HomepageViewController.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 08.06.22.
//

import UIKit

class HomepageViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        searchBar.delegate = self
        searchBar.placeholder = "Search"
    }
}

extension HomepageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
