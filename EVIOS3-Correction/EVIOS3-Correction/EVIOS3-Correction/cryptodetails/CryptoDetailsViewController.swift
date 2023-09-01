//
//  CryptoDetailsViewController.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 01/09/2023.
//

import UIKit
import Alamofire

class CryptoDetailsViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var cryptoDetailsTableView: UITableView!
    @IBOutlet weak var cryptoPrice: UILabel!
    @IBOutlet weak var cryptoName: UILabel!
    var crypto: Crypto?
    var cryptoDetailsList = [CryptoDetails]()
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptoName.text = crypto?.name
        cryptoPrice.text = formattedPrice(priceUsd: crypto?.priceUsd ?? "error")
        
        //appel réseau
        networkCall()
        
        //Setup de la tableView
        cryptoDetailsTableView.dataSource = self
        cryptoDetailsTableView.delegate = self
        cryptoDetailsTableView.register(UINib(nibName: "CryptoDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CryptoDetailsTableViewCell")
    }
    
    //MARK: Network
    func networkCall() {
        let id = crypto?.id
        
        AF.request("https://api.coincap.io/v2/assets/\(id ?? "bitcoin")/history?interval=d1").response { response in
            switch response.result {
                
            case.success(let data):
                guard let data else { return }
                let decoder = JSONDecoder()
                
                do {
                    let cryptoDetailsResponse = try decoder.decode(CryptoDetailsResponse.self, from: data)
                    
                    self.cryptoDetailsList = cryptoDetailsResponse.data
                    
                    //afficher la tableView
                    self.cryptoDetailsTableView.reloadData()
                    
                } catch {
                    print("Error, can't parse JSON.")
                }
            case.failure(let error): print("Error, can't download. (error = \(error)")
            }
        }
    }
}

//MARK: TableView Extension
extension CryptoDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoDetailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CryptoDetailsTableViewCell", for: indexPath) as! CryptoDetailsTableViewCell
        
        //reversed pour affiche dans l'ordre antichronologique
        customCell.setup(cryptoDetails: cryptoDetailsList.reversed()[indexPath.row])
        
        return customCell
    }
}
