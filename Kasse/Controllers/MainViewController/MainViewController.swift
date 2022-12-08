//
//  MainViewController.swift
//  Kasse
//
//  Created by Денис on 06.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // activate vibration
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    let time = Time()
    
    var currentRecord: RecordModel!
    var defaultValue = 0.0
    var totalCoins = 0.0
    var totalPaper = 0.0
    
    // MARK: - TF and Labels
    
    // UI buttons
    @IBOutlet weak var grabber: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    //coins
    @IBOutlet weak var oneCent: UITextField!
    @IBOutlet weak var oneCentResult: UILabel!
    @IBOutlet weak var twoCent: UITextField!
    @IBOutlet weak var twoCentResult: UILabel!
    @IBOutlet weak var fiveCent: UITextField!
    @IBOutlet weak var fiveCentResult: UILabel!
    @IBOutlet weak var tenCent: UITextField!
    @IBOutlet weak var tenCentResult: UILabel!
    @IBOutlet weak var twentyCent: UITextField!
    @IBOutlet weak var twentyCentResult: UILabel!
    @IBOutlet weak var fiftyCent: UITextField!
    @IBOutlet weak var fiftyCentResult: UILabel!
    @IBOutlet weak var oneEuro: UITextField!
    @IBOutlet weak var oneEuroResult: UILabel!
    @IBOutlet weak var twoEuro: UITextField!
    @IBOutlet weak var twoEuroResult: UILabel!
    @IBOutlet var coinsTextFields: [UITextField]!
    
    //paper
    @IBOutlet weak var fiveEuro: UITextField!
    @IBOutlet weak var fiveEuroResult: UILabel!
    @IBOutlet weak var tenEuro: UITextField!
    @IBOutlet weak var tenEuroResult: UILabel!
    @IBOutlet weak var twentyEuro: UITextField!
    @IBOutlet weak var twentyEuroResult: UILabel!
    @IBOutlet weak var fiftyEuro: UITextField!
    @IBOutlet weak var fiftyEuroResult: UILabel!
    @IBOutlet weak var hundredEuro: UITextField!
    @IBOutlet weak var hundredEuroResult: UILabel!
    @IBOutlet weak var twoHundredEuro: UITextField!
    @IBOutlet weak var twoHundredEuroResult: UILabel!
    @IBOutlet var paperTextFields: [UITextField]!
    
    @IBOutlet var resultsLabels: [UILabel]!
    
    @IBOutlet weak var totalCoinsLabel: UILabel!
    @IBOutlet weak var totalPaperLabel: UILabel!
    
    @IBOutlet weak var generallyTotalLabel: UILabel!
    @IBOutlet weak var countBoxView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecordFromHistory()
        hideKeyboardWhenTappedAround()
        setupTextFields()
        countBoxView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
    }
    
    @objc func coinsTextFieldDidChange() {
        calculateCoins()
        getTotal()
    }
    
    @objc func paperTextFieldDidChange() {
        calculatePaper()
        getTotal()
    }
    
    private func setupTextFields() {
        for tf in coinsTextFields {
            tf.addTarget(self, action: #selector(coinsTextFieldDidChange), for: .editingChanged)
        }
        
        for tf in paperTextFields {
            tf.addTarget(self, action: #selector(paperTextFieldDidChange), for: .editingChanged)
        }
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        feedbackGenerator.impactOccurred()
        DispatchQueue.main.async {
            self.save()
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        showAlert()
    }
    
}
