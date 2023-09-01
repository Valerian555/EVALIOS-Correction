//
//  ViewController.swift
//  EVIOS3-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit
import Alamofire

class CryptoLiveViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var cryptoLoader: UIActivityIndicatorView!
    @IBOutlet weak var cryptoLiveTableView: UITableView!
    var cryptoList = [Crypto]()
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //titre de la navbar
        self.title = "CryptoLive"
        
        //appel de données
        networkCall()
        
        //Appel du pullToRefresh
        configureRefreshControl()
        
        //tableView setup
        cryptoLiveTableView.delegate = self
        cryptoLiveTableView.dataSource = self
        cryptoLiveTableView.register(UINib(nibName: "CryptoLiveTableViewCell", bundle: nil), forCellReuseIdentifier: "CryptoLiveTableViewCell")
    }
    
    //MARK: NETWORK
    func networkCall() {
        //lancer l'animation de chargement
        cryptoLoader.startAnimating()
        
        //appeller le endpoint de l'API
        AF.request("https://api.coincap.io/v2/assets").response { response in
            switch response.result {
                
            case.success(let data):
                guard let data else { return }
                
                //Decoder le JSON
                let decoder = JSONDecoder()
                
                do {
                    let cryptoResponse = try decoder.decode(CryptoResponse.self, from: data)
                    
                    //mettre les données dans une liste
                    self.cryptoList = cryptoResponse.data
                    
                    //faire patienter 1sec pour le chargement de la tableView
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        //arrêter l'animation si les données sont récupérées
                        self.stopLoader()
                        //afficher la tableView
                        self.cryptoLiveTableView.reloadData()
                    }
                    
                } catch {
                    print("Error, can't parse JSON.")
                    //arrêter l'animation du loader
                    self.stopLoader()
                }
                
            case.failure(let error): print("Error, can't download. (error = \(error)")
                //arrêter l'animation du loader
                self.stopLoader()
            }
        }
    }
    
    func stopLoader() {
        cryptoLoader.stopAnimating()
        cryptoLoader.isHidden = true
    }
    
    //MARK: PullToRefresh
    func configureRefreshControl() {
        cryptoLiveTableView.refreshControl = UIRefreshControl()
        cryptoLiveTableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        
        //texte lors du pullToRefresh
        cryptoLiveTableView.refreshControl?.attributedTitle = NSAttributedString(string: "Updating data")
    }
    
    @objc func handleRefreshControl() {
        //update my data
        networkCall()
        
        //désactiver le refresh control (laisser charger 2sec)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.cryptoLiveTableView.refreshControl?.endRefreshing()
        }
    }
    
    //MARK: SegmentedControl
    @IBAction func segmentedSort(_ sender: UISegmentedControl) {
        //Obtenez l'index de l'option sélectionnée
        let selectedIndex = sender.selectedSegmentIndex
        
        switch selectedIndex {
        case 0: cryptoList = cryptoList.sorted {
            if let rank1 = Int($0.rank!), let rank2 = Int($1.rank!) {
                return rank1 < rank2
            }
            return false
        }
        case 1:
            cryptoList = cryptoList.sorted {
                if let percent1 = Double($0.changePercent24Hr!), let percent2 = Double($1.changePercent24Hr!) {
                    return percent1 < percent2
                }
                return false
            }
        case 2:
            cryptoList = cryptoList.sorted {
                if let percent1 = Double($0.changePercent24Hr!), let percent2 = Double($1.changePercent24Hr!) {
                    return percent1 > percent2
                }
                return false
            }
        default:
            break
        }
        
        cryptoLiveTableView.reloadData()
    }
}

//MARK: TableView extension
extension CryptoLiveViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CryptoLiveTableViewCell", for: indexPath) as! CryptoLiveTableViewCell
        
        customCell.setup(crypto: cryptoList[indexPath.row], parentViewController: self)
        
        return customCell
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //instancier le ViewController de destination
        if let cryptoDetailsViewController = storyboard?.instantiateViewController(identifier: "CryptoDetailsViewController") as? CryptoDetailsViewController {
            
            //passage de données
            cryptoDetailsViewController.crypto = cryptoList[indexPath.row]
            
            //méthode permettant la navigation
            navigationController?.pushViewController(cryptoDetailsViewController, animated: true)
        }
    }
}

