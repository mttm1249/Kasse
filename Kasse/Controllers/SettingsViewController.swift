//
//  SettingsViewController.swift
//  Kasse
//
//  Created by Денис on 12.12.2022.
//

import RealmSwift
import UIKit

class SettingsViewController: UIViewController {
    
    private let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var moneyBalanceSwitcher: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let loadedResult = userDefaults.bool(forKey: "moneySwitcher")
        moneyBalanceSwitcher.isOn = loadedResult
    }
    
    @IBAction func moneyBalanceSwitcherAction(_ sender: Any) {
        userDefaults.set(moneyBalanceSwitcher.isOn, forKey: "moneySwitcher")
    }
    
    private func deleteAllRecords() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Achtung!", message: "Alle Einträge löschen?", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Ja", style: .destructive) { action in
            self.deleteAllRecords()
        }
        let cancelAction = UIAlertAction(title: "Hast'n Knall? Nein!", style: .default) { _ in }
        
        alertController.addAction(cancelAction)
        alertController.addAction(resetAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func deleteAllRecordsAction(_ sender: Any) {
        showAlert()
    }
    
}
