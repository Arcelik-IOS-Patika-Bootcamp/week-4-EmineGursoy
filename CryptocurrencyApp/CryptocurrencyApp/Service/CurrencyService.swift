//
//  CurrencyService.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 13.06.22.
//

import Foundation

class CurrencyService {
    func fetchCurrencies(completion: @escaping ([CryptoCurrency], Error?) -> Void) {
        let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=5db3f1d4fb94d1f1c4c1155eb262638b1503aada")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion([], error)
            } else if let data = data {
                if let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data) {
                    completion(cryptoList, nil)
                }
            }
            
        }.resume()
    }
}
