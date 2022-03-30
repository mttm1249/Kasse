//
//  RollViewController.swift
//  coins
//
//  Created by Денис on 21.03.2022.
//

import Foundation
import UIKit
import AudioToolbox

class RollenViewController: UIViewController {
    
    // activate vibration
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    var oneCentValue = 0.00
    var twoCentValue = 0.00
    var fiveCentValue = 0.00
    var tenCentValue = 0.00
    var twentyCentValue = 0.00
    var fiftyCentValue = 0.00
    var oneEuroValue = 0.00
    var twoEuroValue = 0.00
    var oneOneOneEuroValue = 0.00
    
    var oneCentCounter = 0
    var twoCentCounter = 0
    var fiveCentCounter = 0
    var tenCentCounter = 0
    var twentyCentCounter = 0
    var fiftyCentCounter = 0
    var oneEuroCounter = 0
    var twoEuroCounter = 0
    var oneOneOneEuroCounter = 0
    
    var total = 0.00 {
        didSet {
            generallyTotalLabel.text = "Gesamt: \(NSString(format: "%.2f", total))€"
        }
    }
    
    // MARK: - TF and Labels
    
    @IBOutlet weak var oneCentLabel: UILabel!
    @IBOutlet weak var twoCentLabel: UILabel!
    @IBOutlet weak var fiveCentLabel: UILabel!
    @IBOutlet weak var tenCentLabel: UILabel!
    @IBOutlet weak var twentyCentLabel: UILabel!
    @IBOutlet weak var fifltyCentLabel: UILabel!
    @IBOutlet weak var oneEuroLabel: UILabel!
    @IBOutlet weak var twoEuroLabel: UILabel!
    @IBOutlet weak var hundredEuroLabel: UILabel!
    
    @IBOutlet weak var generallyTotalLabel: UILabel!
    
    @IBOutlet weak var test: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Buttons
    
    func buttonAnimation(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 1.4,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.2),
                                   initialSpringVelocity: CGFloat(60.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
    }
    
    @IBAction func oneCentRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        oneCentValue += 0.50
        oneCentCounter += 1
        oneCentLabel.text = "1c: \(NSString(format: "%.2f", oneCentValue))€ (\(oneCentCounter))"
        calculate()
    }
    
    @IBAction func twoCentRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        twoCentValue += 1.00
        twoCentCounter += 1
        twoCentLabel.text = "2c: \(NSString(format: "%.2f", twoCentValue))€ (\(twoCentCounter))"
        calculate()
    }
    
    @IBAction func fiveCentRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        fiveCentValue += 2.50
        fiveCentCounter += 1
        fiveCentLabel.text = "5c: \(NSString(format: "%.2f", fiveCentValue))€ (\(fiveCentCounter))"
        calculate()
    }
    
    @IBAction func tenCentRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        tenCentValue += 4.00
        tenCentCounter += 1
        tenCentLabel.text = "10c: \(NSString(format: "%.2f", tenCentValue))€ (\(tenCentCounter))"
        calculate()
    }
    
    @IBAction func twentyCentRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        twentyCentValue += 8.00
        twentyCentCounter += 1
        twentyCentLabel.text = "20c: \(NSString(format: "%.2f", twentyCentValue))€ (\(twentyCentCounter))"
        calculate()
    }
    
    @IBAction func fiftyCentRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        fiftyCentValue += 20.00
        fiftyCentCounter += 1
        fifltyCentLabel.text = "50c: \(NSString(format: "%.2f", fiftyCentValue))€ (\(fiftyCentCounter))"
        calculate()
    }
    
    @IBAction func oneEuroRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        oneEuroValue += 25.00
        oneEuroCounter += 1
        oneEuroLabel.text = "1€: \(NSString(format: "%.2f", oneEuroValue))€ (\(oneEuroCounter))"
        calculate()
    }
    
    @IBAction func twoEuroRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        twoEuroValue += 50.00
        twoEuroCounter += 1
        twoEuroLabel.text = "2€: \(NSString(format: "%.2f", twoEuroValue))€ (\(twoEuroCounter))"
        calculate()
    }
    
    @IBAction func hundredEuroRollenAction(_ sender: UIButton) {
        buttonAnimation(sender)
        feedbackGenerator.impactOccurred()
        oneOneOneEuroValue += 111.00
        oneOneOneEuroCounter += 1
        hundredEuroLabel.text = "111€: \(NSString(format: "%.2f", oneOneOneEuroValue))€ (\(oneOneOneEuroCounter))"
        calculate()
    }
    
    func calculate() {
        total = oneCentValue +
        twoCentValue +
        fiveCentValue +
        tenCentValue +
        twentyCentValue +
        fiftyCentValue +
        oneEuroValue +
        twoEuroValue +
        oneOneOneEuroValue
    }
    @IBAction func resetButton(_ sender: Any) {
        feedbackGenerator.impactOccurred()

        oneCentValue = 0.00
        twoCentValue = 0.00
        fiveCentValue = 0.00
        tenCentValue = 0.00
        twentyCentValue = 0.00
        fiftyCentValue = 0.00
        oneEuroValue = 0.00
        twoEuroValue = 0.00
        oneOneOneEuroValue = 0.00
        
        oneCentCounter = 0
        twoCentCounter = 0
        fiveCentCounter = 0
        tenCentCounter = 0
        twentyCentCounter = 0
        fiftyCentCounter = 0
        oneEuroCounter = 0
        twoEuroCounter = 0
        oneOneOneEuroCounter = 0
        total = 0.00
        
        oneCentLabel.text = "1c:"
        twoCentLabel.text = "2c:"
        fiveCentLabel.text = "5c:"
        tenCentLabel.text = "10c:"
        twentyCentLabel.text = "20c:"
        fifltyCentLabel.text = "50c:"
        oneEuroLabel.text = "1€:"
        twoEuroLabel.text = "2€:"
        hundredEuroLabel.text = "111€:"
    }
}
