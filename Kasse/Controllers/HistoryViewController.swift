//
//  HistoryTableView.swift
//  coins
//
//  Created by Денис on 20.03.2022.
//

import RealmSwift
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var records: Results<RecordModel>!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        records = realm.objects(RecordModel.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        registerTableViewCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "RecordCell", bundle: nil)
        self.tableView.register(textFieldCell,forCellReuseIdentifier: "recordCell")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell") as? RecordCell {
            cell.setup(model: records.reversed()[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let record = records.reversed()[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Löschen") {  (contextualAction, view, boolValue) in
            StorageManager.deleteObject(record)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeActions
    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let mainVC =  segue.destination as? MainViewController else { return }
//
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let record = records.reversed()[indexPath.row]
        mainVC.currentRecord = record
        present(mainVC, animated: true)
    }

    @IBAction func deleteAllRecordsButton(_ sender: Any) {

        let alertController = UIAlertController(title: "Achtung!", message: "Alle gespeicherte Daten löschen?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Ja", style: .destructive) { action in
         
            print("all records deleted")
        }

        let cancelAction = UIAlertAction(title: "Abbrechen", style: .default) { _ in }

        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}


