//
//  CryptoDetailsTableViewCell.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 01/09/2023.
//

import UIKit

class CryptoDetailsTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var cryptoPriceUsd: UILabel!
    @IBOutlet weak var cryptoDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(cryptoDetails: CryptoDetails) {
        cryptoPriceUsd.text = formattedPrice(priceUsd: cryptoDetails.priceUsd ?? "error")
        cryptoDate.text = formattedDate(date: cryptoDetails.date ?? "error")
    }
    
    func formattedDate(date: String) -> String {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        let dateDate = dateFormatterInput.date(from: date)
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateStyle = .short
        return dateFormatterOutput.string(from: dateDate ?? Date())
    }
    
}
