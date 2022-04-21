//
//  HistoryTableView.swift
//  coins
//
//  Created by Денис on 20.03.2022.
//

import Foundation
import UIKit
import CoreData

class HistoryTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var records: [Record] = []
    var recordTitle = ""
    var recordDate = ""
    var detailsCoins = ""
    var detailsPaper = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.navigationController?.navigationBar.barTintColor  = .black
        registerTableViewCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = getContext()
        let fetchRequest: NSFetchRequest<Record> = Record.fetchRequest()
        do {
            records = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }
    
    func saveRecord(withTitle title: String) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Record", in: context) else { return }
        let object = Record(entity: entity, insertInto: context)
        object.title = title
        object.date = Date()
        object.detailsCoinsData = MainCalculator.detailInfoCoins
        object.detailsPaperData = MainCalculator.detailInfoPaper
        do {
            try context.save()
            records.append(object)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Table view data source
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "customTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell,forCellReuseIdentifier: "customTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell") as? CustomTableViewCell {
            let record = records[indexPath.row]
            guard let recordDate = record.date else { return cell }
            cell.recordTitleLabel.text = "\(record.title!)"
            cell.recordDateDateLabel.text = "\(dateFormatter.string(from: recordDate))"
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Löschen"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            records.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
            let context = getContext()
            let fetchRequest: NSFetchRequest<Record> = Record.fetchRequest()
            
            if let records = try? context.fetch(fetchRequest) {
                let record = records[indexPath.row]
                context.delete(record)
            }
            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc =  segue.destination as? DetailsViewController else { return }
        
        dvc.total = "\(recordTitle)"
        dvc.date = "\(recordDate)"
        dvc.detailsCoins = "\(detailsCoins)"
        dvc.detailsPaper = "\(detailsPaper)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let record = self.records[indexPath.row]
        self.recordTitle = record.title!
        self.recordDate = "\(dateFormatter.string(from:record.date!))"
        self.detailsCoins = record.detailsCoinsData!
        self.detailsPaper = record.detailsPaperData!
        
        self.performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    @IBAction func deleteAllRecordsButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Achtung!", message: "Alle gespeicherte Daten löschen?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Ja", style: .destructive) { action in
            let context = self.getContext()
            let fetchRequest: NSFetchRequest<Record> = Record.fetchRequest()
            
            if let records = try? context.fetch(fetchRequest) {
                for record in records {
                    context.delete(record)
                }
            }
            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            self.records.removeAll()
            self.tableView.reloadData()
            print("all records deleted")
        }
        
        let cancelAction = UIAlertAction(title: "Abbrechen", style: .default) { _ in }
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
    }
}


