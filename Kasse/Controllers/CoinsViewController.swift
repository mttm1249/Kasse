//
//  CoinsViewController.swift
//  coins
//
//  Created by Денис on 17.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // activate vibration
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    let defaultValue = 0.00
    var totalCoins = 0.00
    
    // MARK: - TF and Labels
    
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
    @IBOutlet weak var totalCoinsLabel: UILabel!
    @IBOutlet weak var totalPaperLabel: UILabel!
    
    @IBOutlet weak var generallyTotalLabel: UILabel!
  
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCalculator.coins = 0.00
        MainCalculator.paper = 0.00
        MainCalculator.detailInfoPaper = "Nothing here"
        MainCalculator.detailInfoCoins = "Nothing here"
        hideKeyboardWhenTappedAround()
        oneCent.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        twoCent.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        fiveCent.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        tenCent.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        twentyCent.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        fiftyCent.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        oneEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        twoEuro.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalCoinsLabel.text = "Münzen: \(NSString(format: "%.2f", MainCalculator.coins!))€"
        totalPaperLabel.text = "Scheine: \(NSString(format: "%.2f", MainCalculator.paper!))€"
    }
    
    @objc func textFieldDidChange() {
        calculation()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        feedbackGenerator.impactOccurred()
        
        // reset labels
        
        oneCent.text = ""
        oneCentResult.text = "0.00€"
        twoCent.text = ""
        twoCentResult.text = "0.00€"
        fiveCent.text = ""
        fiveCentResult.text = "0.00€"
        tenCent.text = ""
        tenCentResult.text = "0.00€"
        twentyCent.text = ""
        twentyCentResult.text = "0.00€"
        fiftyCent.text = ""
        fiftyCentResult.text = "0.00€"
        oneEuro.text = ""
        oneEuroResult.text = "0.00€"
        twoEuro.text = ""
        twoEuroResult.text = "0.00€"
        generallyTotalLabel.text = "Gesamt: 0.00€"
        
        // reset data
        
        MainCalculator.coins = 0.00
        MainCalculator.paper = 0.00
        MainCalculator.detailInfoPaper = "Nothing here"
        MainCalculator.detailInfoCoins = "Nothing here"
        totalCoinsLabel.text = "Münzen: \(NSString(format: "%.2f", MainCalculator.coins!))€"
        totalPaperLabel.text = "Scheine: \(NSString(format: "%.2f", MainCalculator.paper!))€"
    }
    
    func calculation() {
        // 1
        guard let one = oneCent.text else { return }
        let doubleOne = Double(one) ?? defaultValue
        let calc = doubleOne * 0.01
        
        oneCentResult.text = "\(NSString(format: "%.2f", calc))€"
        
        // 2
        guard let two = twoCent.text else { return }
        let doubleTwo = Double(two) ?? defaultValue
        let calc2 = doubleTwo * 0.02
        
        twoCentResult.text = "\(NSString(format: "%.2f", calc2))€"
        
        // 5
        guard let five = fiveCent.text else { return }
        let doubleFive = Double(five) ?? defaultValue
        let calc3 = doubleFive * 0.05
        
        fiveCentResult.text = "\(NSString(format: "%.2f", calc3))€"
        
        // 10
        guard let ten = tenCent.text else { return }
        let doubleTen = Double(ten) ?? defaultValue
        let calc4 = doubleTen * 0.10
        
        tenCentResult.text = "\(NSString(format: "%.2f", calc4))€"
        
        // 20
        guard let twenty = twentyCent.text else { return }
        let doubleTwenty = Double(twenty) ?? defaultValue
        let calc5 = doubleTwenty * 0.20
        
        twentyCentResult.text = "\(NSString(format: "%.2f", calc5))€"
        
        // 50
        guard let fifty = fiftyCent.text else { return }
        let doubleFifty = Double(fifty) ?? defaultValue
        let calc6 = doubleFifty * 0.50
        
        fiftyCentResult.text = "\(NSString(format: "%.2f", calc6))€"
        
        // 1.00
        guard let oneEuro = oneEuro.text else { return }
        let doubleOneEuro = Double(oneEuro) ?? defaultValue
        let calc7 = doubleOneEuro * 1.00
        
        oneEuroResult.text = "\(NSString(format: "%.2f", calc7))€"
        
        // 2.00
        guard let twoEuro = twoEuro.text else { return }
        let doubleTwoEuro = Double(twoEuro) ?? defaultValue
        let calc8 = doubleTwoEuro * 2.00
        
        twoEuroResult.text = "\(NSString(format: "%.2f", calc8))€"
        
        // total in coins
        let total = calc + calc2 + calc3 + calc4 + calc5 +  calc6 + calc7 + calc8
        totalCoinsLabel.text = "Münzen: \(NSString(format: "%.2f", total))€"
        totalCoins = total
        MainCalculator.coins = totalCoins
        MainCalculator.detailInfoCoins = """

1 - (\(one)) = \(NSString(format: "%.2f", calc))€ \

2 - (\(two)) = \(NSString(format: "%.2f", calc2))€ \

5 - (\(five)) = \(NSString(format: "%.2f", calc3))€ \

10 - (\(ten)) = \(NSString(format: "%.2f", calc4))€ \

20 - (\(twenty)) = \(NSString(format: "%.2f", calc5))€ \

50 - (\(fifty)) = \(NSString(format: "%.2f", calc6))€ \

1 - (\(oneEuro)) = \(NSString(format: "%.2f", calc7))€ \

2 - (\(twoEuro)) = \(NSString(format: "%.2f", calc8))€ \

Münzen: - \(NSString(format: "%.2f", total))€ \

================ \

"""
    }
    
    @IBAction func countActionButton(_ sender: UIButton) {
        feedbackGenerator.impactOccurred()
        
        let coinsAndPaper = MainCalculator.coins + MainCalculator.paper
        generallyTotalLabel.text = "Gesamt: \(NSString(format: "%.2f", coinsAndPaper))€"
        
        let history = HistoryTableView()
        history.saveRecord(withTitle: "Gesamt: \(NSString(format: "%.2f",coinsAndPaper))€")
    }
}

// MARK: - Hide Keyboard Method
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
