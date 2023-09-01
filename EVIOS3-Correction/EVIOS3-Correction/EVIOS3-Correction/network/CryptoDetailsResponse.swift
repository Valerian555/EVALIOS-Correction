//
//  CryptoDetailsResponse.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 01/09/2023.
//

import Foundation

struct CryptoDetailsResponse: Codable {
    let data: [CryptoDetails]
}

struct CryptoDetails: Codable {
    let priceUsd: String?
    let date: String? 
}
