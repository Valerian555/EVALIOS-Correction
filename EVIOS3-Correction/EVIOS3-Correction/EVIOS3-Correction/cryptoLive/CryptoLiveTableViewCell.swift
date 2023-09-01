//
//  CryptoLiveTableViewCell.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit
import SafariServices

class CryptoLiveTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var cryptoButton: UIButton!
    @IBOutlet weak var cryptoView: UIView!
    @IBOutlet weak var cryptoLiveName: UILabel!
    @IBOutlet weak var cryptoChange24Hr: UILabel!
    @IBOutlet weak var cryptoPriceUsd: UILabel!
    @IBOutlet weak var cryptoRank: UILabel!
    @IBOutlet weak var cryptoRankView: UIView!
    var cryptoUrl: String?
    weak var parentViewController: UIViewController?
    
    //MARK: Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cryptoView.layer.cornerRadius = 20
        cryptoView.clipsToBounds = true
        
        cryptoRankView.layer.cornerRadius = cryptoRankView.frame.height / 2
        cryptoRankView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(crypto: Crypto, parentViewController: UIViewController) {
        cryptoLiveName.text = crypto.name
        cryptoChange24Hr.text = formattedPercent(percent: crypto.changePercent24Hr ?? "error")
        cryptoRank.text = crypto.rank
        cryptoPriceUsd.text = formattedPrice(priceUsd: crypto.priceUsd ?? "error")
        cryptoButton.addTarget(self, action: #selector(openCryptoURL), for: .touchUpInside)
        
        self.parentViewController = parentViewController
        cryptoUrl = crypto.explorer ?? ""
        
    }
    
    @objc func openCryptoURL() {
        //ouverture du safariController
        if let url = URL(string: cryptoUrl ?? ""), let parentVC = parentViewController
        {
            let vc = SFSafariViewController (url: url)
            parentVC.present(vc, animated: true)
        }
    }
    
    func formattedPercent(percent: String) -> String? {
        if let decimalValue = Double(percent) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.percentSymbol = "%"
            formatter.maximumFractionDigits = 2 // Nombre de chiffres après la virgule
            
            if decimalValue >= 0 {
                cryptoChange24Hr.textColor = UIColor(named: "green")
            } else {
                cryptoChange24Hr.textColor = UIColor(named: "red")
            }
            if let formatted = formatter.string(from: NSNumber(value: decimalValue / 100)) {
                
                return formatted
            }
        }
        return "- %"
    }    
}
