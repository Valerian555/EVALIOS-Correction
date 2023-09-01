//
//  CryptoListResponse.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 01/09/2023.
//

import Foundation

struct CryptoListResponse: Codable {
    let coins: [CryptoList]
}

struct CryptoList: Codable {
    let name: String?
    let icon: String?
}
