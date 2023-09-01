//
//  CryptoListTableViewCell.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 01/09/2023.
//

import UIKit
import AlamofireImage

class CryptoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cryptoImage: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(crypto: CryptoList) {
        cryptoName.text = crypto.name
        
        guard let cryptoUrl = crypto.icon else {
            return
        }
        
        //setup de l'image
        cryptoImage.af.setImage(withURL: URL(string: cryptoUrl)!)
    }
}
