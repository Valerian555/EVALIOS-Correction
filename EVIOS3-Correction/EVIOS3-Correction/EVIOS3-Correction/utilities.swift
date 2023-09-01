//
//  utilities.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 01/09/2023.
//

import Foundation

func formattedPrice(priceUsd: String) -> String? {
    if let double = Double(priceUsd) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: double as NSNumber)
    }
    return "- $"
}
