//
//  RollViewController.swift
//  coins
//
//  Created by Денис on 21.03.2022.
//

import UIKit

class RollenViewController: UIViewController {
    
    // activate vibration
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    var buttonBadge = UIView()
        
    var oneCentValue = 0.0
    var twoCentValue = 0.0
    var fiveCentValue = 0.0
    var tenCentValue = 0.0
    var twentyCentValue = 0.0
    var fiftyCentValue = 0.0
    var oneEuroValue = 0.0
    var twoEuroValue = 0.0
    var oneOneOneEuroValue = 0.0
    
    var oneCentCounter = 0
    var twoCentCounter = 0
    var fiveCentCounter = 0
    var tenCentCounter = 0
    var twentyCentCounter = 0
    var fiftyCentCounter = 0
    var oneEuroCounter = 0
    var twoEuroCounter = 0
    var oneOneOneEuroCounter = 0
    
    @IBOutlet var allLabels: [UILabel]!
    @IBOutlet var allButtons: [UIButton]!
    
    @IBOutlet weak var oneCentButton: UIButton!
    @IBOutlet weak var twoCentButton: UIButton!
    @IBOutlet weak var fiveCentButton: UIButton!
    @IBOutlet weak var tenCentButton: UIButton!
    @IBOutlet weak var twentyCentButton: UIButton!
    @IBOutlet weak var fiftyCentButton: UIButton!
    @IBOutlet weak var oneEuroButton: UIButton!
    @IBOutlet weak var twoEuroButton: UIButton!
    @IBOutlet weak var oneOneOneEuroButton: UIButton!
    
    var total = 0.0 {
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
    @IBOutlet weak var fiftyCentLabel: UILabel!
    @IBOutlet weak var oneEuroLabel: UILabel!
    @IBOutlet weak var twoEuroLabel: UILabel!
    
    @IBOutlet weak var generallyTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsStyle()
        addLongPressGesture()
    }
    
    // MARK: - Buttons
    
    func setupButtonsStyle() {
        twoCentButton.layer.borderWidth = 5
        twoCentButton.layer.borderColor = #colorLiteral(red: 0.5098040104, green: 0.5098040104, blue: 0.5098040104, alpha: 1).cgColor
        
        fiveCentButton.layer.borderWidth = 5
        fiveCentButton.layer.borderColor = #colorLiteral(red: 0.9335795045, green: 0.1790794134, blue: 0.2600350678, alpha: 1).cgColor
        
        tenCentButton.layer.borderWidth = 5
        tenCentButton.layer.borderColor = #colorLiteral(red: 0.2370495498, green: 0.572063148, blue: 0.7664478421, alpha: 1).cgColor
        
        twentyCentButton.layer.borderWidth = 5
        twentyCentButton.layer.borderColor = #colorLiteral(red: 1, green: 0.4975169897, blue: 0, alpha: 1).cgColor
        
        fiftyCentButton.layer.borderWidth = 5
        fiftyCentButton.layer.borderColor = #colorLiteral(red: 0.5352399945, green: 0.9992745519, blue: 0.2623248994, alpha: 1).cgColor
        
        oneEuroButton.layer.borderWidth = 5
        oneEuroButton.layer.borderColor = #colorLiteral(red: 0.9961612821, green: 0.9025582671, blue: 0, alpha: 1).cgColor
        
        twoEuroButton.layer.borderWidth = 5
        twoEuroButton.layer.borderColor = #colorLiteral(red: 0.4879955053, green: 0.2289537489, blue: 0.6078056097, alpha: 1).cgColor
    }
    
    func buttonAnimation(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.50),
                       initialSpringVelocity: CGFloat(20.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
            sender.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
    }
    
    @IBAction func buttonsActions(_ sender: Any) {
        feedbackGenerator.impactOccurred()
        buttonAnimation(sender as! UIButton)
        
        let tag = (sender as AnyObject).tag
        
        switch tag {
        case 1:
            oneCentValue += 0.50
            oneCentCounter += 1
            oneCentLabel.text = "1c: \(NSString(format: "%.2f", oneCentValue))€ (\(oneCentCounter))"
            addToTotal(value: 0.50)
        case 2:
            twoCentValue += 1.00
            twoCentCounter += 1
            twoCentLabel.text = "2c: \(NSString(format: "%.2f", twoCentValue))€ (\(twoCentCounter))"
            addToTotal(value: 1.00)
        case 3:
            fiveCentValue += 2.50
            fiveCentCounter += 1
            fiveCentLabel.text = "5c: \(NSString(format: "%.2f", fiveCentValue))€ (\(fiveCentCounter))"
            addToTotal(value: 2.50)
        case 4:
            tenCentValue += 4.00
            tenCentCounter += 1
            tenCentLabel.text = "10c: \(NSString(format: "%.2f", tenCentValue))€ (\(tenCentCounter))"
            addToTotal(value: 4.00)
        case 5:
            twentyCentValue += 8.00
            twentyCentCounter += 1
            twentyCentLabel.text = "20c: \(NSString(format: "%.2f", twentyCentValue))€ (\(twentyCentCounter))"
            addToTotal(value: 8.00)
        case 6:
            fiftyCentValue += 20.00
            fiftyCentCounter += 1
            fiftyCentLabel.text = "50c: \(NSString(format: "%.2f", fiftyCentValue))€ (\(fiftyCentCounter))"
            addToTotal(value: 20.00)
        case 7:
            oneEuroValue += 25.00
            oneEuroCounter += 1
            oneEuroLabel.text = "1€: \(NSString(format: "%.2f", oneEuroValue))€ (\(oneEuroCounter))"
            addToTotal(value: 25.00)
        case 8:
            twoEuroValue += 50.00
            twoEuroCounter += 1
            twoEuroLabel.text = "2€: \(NSString(format: "%.2f", twoEuroValue))€ (\(twoEuroCounter))"
            addToTotal(value: 50.00)
        case 9:
            addAllOneByOne()
            oneOneOneEuroCounter += 1
            buttonBadge.addSubview(showBadge(with: oneOneOneEuroCounter))
            oneOneOneEuroButton.addSubview(buttonBadge)
            addToTotal(value: 111.00)
        default:
            break
        }
    }
    
    func addToTotal(value: Double) {
        total += value
    }
    
    func deleteFromTotal(value: Double) {
        total -= value
    }
    
    @IBAction func resetButton(_ sender: Any) {
        feedbackGenerator.impactOccurred()
        buttonBadge.removeFromSuperview()
        
        oneCentValue = 0.0
        twoCentValue = 0.0
        fiveCentValue = 0.0
        tenCentValue = 0.0
        twentyCentValue = 0.0
        fiftyCentValue = 0.0
        oneEuroValue = 0.0
        twoEuroValue = 0.0
        oneOneOneEuroValue = 0.0
        
        oneCentCounter = 0
        twoCentCounter = 0
        fiveCentCounter = 0
        tenCentCounter = 0
        twentyCentCounter = 0
        fiftyCentCounter = 0
        oneEuroCounter = 0
        twoEuroCounter = 0
        oneOneOneEuroCounter = 0
        total = 0.0
        for label in allLabels {
            label.text = ""
        }
    }
}
