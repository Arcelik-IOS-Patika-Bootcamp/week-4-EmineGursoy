//
//  HomeScreenViewModel.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 15.06.22.
//

import Foundation

//What is needed in view model declared

protocol HomeScreenViewModelProtocol {
    var delegate: HomeScreenViewModelDelegate? {get set}
    var numberOfItem: Int { get }
    var allCryptos: [CryptoCurrency] {get}
    func loadCryptos()
    func crypto(index: Int) -> CryptoCurrency?
    
}

//What should we send to view controller
protocol HomeScreenViewModelDelegate: AnyObject {
    func reloadData()
}

final class HomeScreenViewModel{
    weak var delegate: HomeScreenViewModelDelegate?
    let service: CurrencyService
    
    private var cryptos = [CryptoCurrency]() {
        didSet{
            DispatchQueue.main.async {
                self.delegate?.reloadData()
            }
           
        }
    }
    
    init(service: CurrencyService) {
        self.service = service
    }
    
    fileprivate func fetchCryptos(){
        service.fetchCurrencies { cryptoCurrencies, error in
            guard error == nil else {
                return
            }
            self.cryptos = cryptoCurrencies
        }
    }
}

extension HomeScreenViewModel: HomeScreenViewModelProtocol{
    var allCryptos: [CryptoCurrency] {
      cryptos
    }
    
    var numberOfItem: Int {
        cryptos.count
    }
    
    func loadCryptos() {
        fetchCryptos()
    }
    
    func crypto(index: Int) -> CryptoCurrency? {
        cryptos[index]
    }
}
