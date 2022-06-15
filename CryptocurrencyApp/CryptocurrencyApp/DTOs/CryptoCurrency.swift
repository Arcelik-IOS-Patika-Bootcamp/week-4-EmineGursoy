//
//  CryptoCurrency.swift
//  CryptocurrencyApp
//
//  Created by Emine Sinem Gursoy on 13.06.22.
//

import Foundation

struct CryptoCurrency: Decodable {
    let id: String
    let name: String
    let logo_url: String?
    let price: String
    
    init(id: String, name: String, logo_url: String?, price: String) {
        self.id = id
        self.name = name
        self.logo_url = logo_url
        self.price = price
    }
}

extension CryptoCurrency {
    static let mocked: [CryptoCurrency] = [
        CryptoCurrency(id: "BTC", name: "Bitcoin", logo_url: nil, price: "150007$"),
        CryptoCurrency(id: "ETH", name: "Ethereum", logo_url: nil, price: "5.67$")
    ]
}
