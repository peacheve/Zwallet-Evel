//
//  ViewController.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 06/08/23.
//

import UIKit

struct History {
    let image: UIImage
    let name: String
    let desc: String
    let price: String
    let colorTag: Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var shortProfileButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var popUpPage: CustomPopUpPage!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var topUpButton: UIButton!
    @IBOutlet weak var historyTextButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var imageTableView: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var descLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!
    
    let histories: [History] = [
        History(image: UIImage(named: "spotify")!, name: "Spotify", desc: "Subscription", price: "Rp56.000,00", colorTag: 0),
        History(image: UIImage(named: "net")!, name: "Netflix", desc: "Subscription", price: "Rp116.000,00", colorTag: 0),
        History(image: UIImage(named:"mark")!, name: "Mark", desc: "Transfer", price: "Rp1.560.000,00", colorTag: 1),
        History(image: UIImage(named: "minho")!, name: "Felix", desc: "Transfer", price: "Rp850.000,00", colorTag: 1)]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HistoryViewCell", bundle: nil), forCellReuseIdentifier: "CELL_ID")
    }
    
    
    @IBAction func shortProfileTapped(_ sender: Any) {
            showProfileViewController()

    }
    
    @IBAction func transferButtonTapped(_ sender: Any) {

    }
    
    @IBAction func topUpButtonTapped(_ sender: Any) {
     
    }
    
    
    

    @IBAction func historyTextTapped(_ sender: Any) {
        historyTextButton.isSelected = !historyTextButton.isSelected
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return histories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 5
        
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath) as! HistoryViewCell
        
        
        let history = histories[indexPath.section]
        cell.imageTableView.image = history.image
        cell.nameLabel.text = history.name
        cell.descLabel.text = history.desc
        cell.priceLabel.text = history.price
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true

        if history.colorTag == 1 {
            cell.priceLabel.textColor = UIColor(named: "Success")
        } else {
            cell.priceLabel.textColor = UIColor(named: "Error")
        }
        
        return cell
    }
}

extension ViewController {
    func showProfileViewController() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "profile")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
