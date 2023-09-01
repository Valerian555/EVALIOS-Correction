//
//  CryptoListViewController.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 01/09/2023.
//

import UIKit
import Alamofire

class CryptoListViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var cryptoListTableView: UITableView!
    var cryptoImageList = [CryptoList]()
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkCall()
        
        //tableview setup
        cryptoListTableView.delegate = self
        cryptoListTableView.dataSource = self
        cryptoListTableView.register(UINib(nibName: "CryptoListTableViewCell", bundle: nil), forCellReuseIdentifier: "CryptoListTableViewCell")
    }
    
    
    //MARK: Network
    func networkCall() {
        
        AF.request("https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR").response { response in
            switch response.result {
                
            case.success(let data):
                guard let data else { return }
                let decoder = JSONDecoder()
                
                do {
                    let cryptoListResponse = try decoder.decode(CryptoListResponse.self, from: data)
                    
                    self.cryptoImageList = cryptoListResponse.coins
                    
                    //afficher la tableView
                    self.cryptoListTableView.reloadData()
                    
                } catch {
                    print("Error, can't parse JSON.")
                }
                
            case.failure(let error): print("Error, can't download. (error = \(error)")
            }
        }
    }
}

//MARK: TableView extension
extension CryptoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoImageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CryptoListTableViewCell", for: indexPath) as! CryptoListTableViewCell
        
        customCell.setup(crypto: cryptoImageList[indexPath.row])
        
        return customCell
    }
}
