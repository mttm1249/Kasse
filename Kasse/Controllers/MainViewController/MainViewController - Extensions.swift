//
//  Extensions.swift
//  Kasse
//
//  Created by Денис on 04.12.2022.
//

import UIKit

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


// MARK: Badges
extension RollenViewController {
    func showBadge(with count: Int) -> UIView {
        let badgeCount = UILabel(frame: CGRect(x: 55, y: -10, width: 20, height: 20))
        badgeCount.layer.borderColor = UIColor.clear.cgColor
        badgeCount.layer.borderWidth = 2
        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
        badgeCount.textAlignment = .center
        badgeCount.layer.masksToBounds = true
        badgeCount.textColor = .white
        badgeCount.font = badgeCount.font.withSize(12)
        badgeCount.backgroundColor = .red
        badgeCount.text = String(count)
        return badgeCount
    }
}

extension MainViewController {
    func calculateCoins() {
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
        
        totalCoins = calc + calc2 + calc3 + calc4 + calc5 + calc6 + calc7 + calc8
        totalCoinsLabel.text = "Münzen: \(NSString(format: "%.2f", totalCoins))€"
    }
    
    func calculatePaper() {
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
        
        totalPaper = calc + calc2 + calc3 + calc4 + calc5 + calc6
        totalPaperLabel.text = "Scheine: \(NSString(format: "%.2f", totalPaper))€"
    }
    
    func getTotal() {
        let total = totalCoins + totalPaper
        generallyTotalLabel.text = "Gesamt: \(NSString(format: "%.2f", total))€"
//        calculator.generallyTotall = "Gesamt: \(NSString(format: "%.2f", total))€"
    }
    
    func reset() {
        for coins in coinsTextFields {
            coins.text = ""
        }
        
        for paper in paperTextFields {
            paper.text = ""
        }
        
        for results in resultsLabels {
            results.text = "0.00€"
        }
        totalCoinsLabel.text = "Münzen: 0.00€"
        totalPaperLabel.text = "Scheine: 0.00€"
        generallyTotalLabel.text = "Gesamt: 0.00€"
        
        totalCoins = 0.0
        totalPaper = 0.0
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Achtung!", message: "Alle Werte löschen?", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Ja", style: .destructive) { action in
            self.reset()
        }
        let cancelAction = UIAlertAction(title: "Hast'n Knall? Nein!", style: .default) { _ in }
        
        alertController.addAction(cancelAction)
        alertController.addAction(resetAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Saving record
    func save() {
        let newRecord = RecordModel(date: time.getData(),
                                    totalCoins: totalCoinsLabel.text,
                                    totalPaper: totalPaperLabel.text,
                                    generallyTotall: generallyTotalLabel.text,
                                    oneCent: oneCent.text,
                                    oneCentResult: oneCentResult.text,
                                    twoCent: twoCent.text,
                                    twoCentResult: twoCentResult.text,
                                    fiveCent: fiveCent.text,
                                    fiveCentResult: fiveCentResult.text,
                                    tenCent: tenCent.text,
                                    tenCentResult: tenCentResult.text,
                                    twentyCent: twentyCent.text,
                                    twentyCentResult: twentyCentResult.text,
                                    fiftyCent: fiftyCent.text,
                                    fiftyCentResult: fiftyCentResult.text,
                                    oneEuro: oneEuro.text,
                                    oneEuroResult: oneEuroResult.text,
                                    twoEuro: twoEuro.text,
                                    twoEuroResult: twoEuroResult.text,
                                    fiveEuro: fiveEuro.text,
                                    fiveEuroResult: fiveEuroResult.text,
                                    tenEuro: tenEuro.text,
                                    tenEuroResult: tenEuroResult.text,
                                    twentyEuro: twentyEuro.text,
                                    twentyEuroResult: twentyEuroResult.text,
                                    fiftyEuro: fiftyEuro.text,
                                    fiftyEuroResult: fiftyEuroResult.text,
                                    hundredEuro: hundredEuro.text,
                                    hundredEuroResult: hundredEuroResult.text,
                                    twoHundredEuro: twoHundredEuro.text,
                                    twoHundredEuroResult: twoHundredEuroResult.text)
        if currentRecord == nil {
            StorageManager.saveObject(newRecord)
        }
    }
    
    func loadRecordFromHistory() {
        if currentRecord != nil {
           //setup UI
            grabber.isHidden = false
            saveButton.isHidden = true
            resetButton.isHidden = true
            
            //Setup Labels
            totalCoinsLabel.text = currentRecord.totalCoins
            totalPaperLabel.text = currentRecord.totalPaper
            generallyTotalLabel.text = currentRecord.generallyTotall
            oneCent.text = currentRecord.oneCent
            oneCentResult.text = currentRecord.oneCentResult
            twoCent.text = currentRecord.twoCent
            twoCentResult.text = currentRecord.twoCentResult
            fiveCent.text = currentRecord.fiveCent
            fiveCentResult.text = currentRecord.fiveCentResult
            tenCent.text = currentRecord.tenCent
            tenCentResult.text = currentRecord.tenCentResult
            twentyCent.text = currentRecord.twentyCent
            twentyCentResult.text = currentRecord.twentyCentResult
            fiftyCent.text = currentRecord.fiftyCent
            fiftyCentResult.text = currentRecord.fiftyCentResult
            oneEuro.text = currentRecord.oneEuro
            oneEuroResult.text = currentRecord.oneEuroResult
            twoEuro.text = currentRecord.twoEuro
            twoEuroResult.text = currentRecord.twoEuroResult
            fiveEuro.text = currentRecord.fiveEuro
            fiveEuroResult.text = currentRecord.fiveEuroResult
            tenEuro.text = currentRecord.tenEuro
            tenEuroResult.text = currentRecord.tenEuroResult
            twentyEuro.text = currentRecord.twentyEuro
            twentyEuroResult.text = currentRecord.twentyEuroResult
            fiftyEuro.text = currentRecord.fiftyEuro
            fiftyEuroResult.text = currentRecord.fiftyEuroResult
            hundredEuro.text = currentRecord.hundredEuro
            hundredEuroResult.text = currentRecord.hundredEuroResult
            twoHundredEuro.text = currentRecord.twoHundredEuro
            twoHundredEuroResult.text = currentRecord.twoHundredEuroResult
        } else {
            grabber.isHidden = true
            saveButton.isHidden = false
            resetButton.isHidden = false
        }
    }
}
