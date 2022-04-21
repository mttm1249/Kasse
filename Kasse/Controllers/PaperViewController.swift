//
//  PaperViewController.swift
//  coins
//
//  Created by Денис on 17.03.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    // activate vibration
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)

    let defaultValue = 0.00
    var totalPaper = 0.00
    
    // MARK: - TF and Labels
    
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
    
    @IBOutlet weak var totalCoinsLabel: UILabel!
    @IBOutlet weak var totalPaperLabel: UILabel!
    @IBOutlet weak var generallyTotalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        fiveEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        tenEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        twentyEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        fiftyEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        hundredEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        twoHundredEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func calculation() {
        // 5
        guard let five = fiveEuro.text else { return }
        let doubleFive = Double(five) ?? defaultValue
        let calc = doubleFive * 5.00
        
        fiveEuroResult.text = "\(NSString(format: "%.2f", calc))€"
        
        // 10
        guard let ten = tenEuro.text else { return }
        let doubleTen = Double(ten) ?? defaultValue
        let calc2 = doubleTen * 10.00
        
        tenEuroResult.text = "\(NSString(format: "%.2f", calc2))€"
        
        // 20
        guard let twenty = twentyEuro.text else { return }
        let doubleTwenty = Double(twenty) ?? defaultValue
        let calc3 = doubleTwenty * 20.00
        
        twentyEuroResult.text = "\(NSString(format: "%.2f", calc3))€"
        
        // 50
        guard let fifty = fiftyEuro.text else { return }
        let doubleFifty = Double(fifty) ?? defaultValue
        let calc4 = doubleFifty * 50.00
        
        fiftyEuroResult.text = "\(NSString(format: "%.2f", calc4))€"
        
        // 100
        guard let hundred = hundredEuro.text else { return }
        let doubleHundred = Double(hundred) ?? defaultValue
        let calc5 = doubleHundred * 100.00
        
        hundredEuroResult.text = "\(NSString(format: "%.2f", calc5))€"
        
        // 200
        guard let twoHundred = twoHundredEuro.text else { return }
        let doubleTwoHundred = Double(twoHundred) ?? defaultValue
        let calc6 = doubleTwoHundred * 200.00
        
        twoHundredEuroResult.text = "\(NSString(format: "%.2f", calc6))€"
        
        // total in paper
        let total = calc + calc2 + calc3 + calc4 + calc5 +  calc6
        totalPaperLabel.text = "Scheine: \(NSString(format: "%.2f", total))€"
        totalPaper = total
        MainCalculator.paper = totalPaper
        MainCalculator.detailInfoPaper = """

5 - (\(five)) = \(NSString(format: "%.2f", calc))€ \

10 - (\(ten)) = \(NSString(format: "%.2f", calc2))€ \

20 - (\(twenty)) = \(NSString(format: "%.2f", calc3))€ \

50 - (\(fifty)) = \(NSString(format: "%.2f", calc4))€ \

100 - (\(hundred)) = \(NSString(format: "%.2f", calc5))€ \

200 - (\(twoHundred)) = \(NSString(format: "%.2f", calc6))€ \

Scheine: - \(NSString(format: "%.2f", total))€ \

"""
    }
    
    @IBAction func countActionButton(_ sender: UIButton) {
        feedbackGenerator.impactOccurred()

        let coinsAndPaper = MainCalculator.coins + MainCalculator.paper
        generallyTotalLabel.text = "Gesamt: \(NSString(format: "%.2f", coinsAndPaper))€"
        
        let history = HistoryTableView()
        history.saveRecord(withTitle: "Gesamt: \(NSString(format: "%.2f",coinsAndPaper))€")
    }
    
    @IBAction func resetButton(_ sender: Any) {
        feedbackGenerator.impactOccurred()
        
          // reset labels
          
        fiveEuro.text = ""
        fiveEuroResult.text = "0.00€"
        tenEuro.text = ""
        tenEuroResult.text = "0.00€"
        twentyEuro.text = ""
        twentyEuroResult.text = "0.00€"
        fiftyEuro.text = ""
        fiftyEuroResult.text = "0.00€"
        hundredEuro.text = ""
        hundredEuroResult.text = "0.00€"
        twoHundredEuro.text = ""
        twoHundredEuroResult.text = "0.00€"
        generallyTotalLabel.text = "Gesamt: 0.00€"
        
          // reset data
          
          MainCalculator.coins = 0.00
          MainCalculator.paper = 0.00
          MainCalculator.detailInfoPaper = "Nothing here"
          MainCalculator.detailInfoCoins = "Nothing here"
          totalCoinsLabel.text = "Münzen: \(NSString(format: "%.2f", MainCalculator.coins!))€"
          totalPaperLabel.text = "Scheine: \(NSString(format: "%.2f", MainCalculator.paper!))€"
    }
    
    
    @objc func textFieldDidChange() {
        calculation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        totalCoinsLabel.text = "Münzen: \(NSString(format: "%.2f", MainCalculator.coins!))€"
        totalPaperLabel.text = "Scheine: \(NSString(format: "%.2f", MainCalculator.paper!))€"
    }
}
