//
//  DetailsViewController.swift
//  coins
//
//  Created by Денис on 20.03.2022.
//

import Foundation
import UIKit
import CoreData

class DetailsViewController: UIViewController {
    
    var total: String?
    var date: String?
    var detailsCoins: String?
    var detailsPaper: String?
    
    @IBOutlet weak var detailsTotalLabel: UILabel!
    @IBOutlet weak var detailsDateLabel: UILabel!
    @IBOutlet weak var detailsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor  = .black
        navigationItem.hidesBackButton = true
        let barButton = UIBarButtonItem(title: "< Zurück", style: .plain, target: self, action: #selector(backButton))
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = barButton
        navigationItem.leftBarButtonItem?.tintColor = .white
        detailsText.backgroundColor = .white
        
        guard let total = self.total else { return }
        detailsTotalLabel.text = "\(total)"
        guard let date = self.date else { return }
        detailsDateLabel.text = "\(date)"
        
        guard let detailsCoins = self.detailsCoins else { return }
        guard let detailsPaper = self.detailsPaper else { return }
        
        detailsText.text = "\(detailsCoins)" + "\(detailsPaper)"
    }
    
    @objc func backButton() {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
