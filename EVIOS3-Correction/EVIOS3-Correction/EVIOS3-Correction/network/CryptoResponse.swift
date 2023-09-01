//
//  CryptoResponse.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 31/08/2023.
//

import Foundation

struct CryptoResponse: Codable {
    let data: [Crypto]
}

struct Crypto: Codable {
    let id: String?
    let rank: String?
    let name: String?
    let priceUsd: String?
    let changePercent24Hr: String?
    let explorer: String?
}
