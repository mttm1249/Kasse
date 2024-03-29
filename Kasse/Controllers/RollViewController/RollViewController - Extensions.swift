//
//  RollViewExtensions.swift
//  Kasse
//
//  Created by Денис on 05.12.2022.
//

import UIKit

extension RollenViewController {
    
    func addLongPressGesture() {
        for button in allButtons {
           
            switch button.tag {
            case 1:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(oneCentLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 2:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(twoCentLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 3:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(fiveCentLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 4:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(tenCentLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 5:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(twentyCentLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 6:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(fiftyCentLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 7:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(oneEuroLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 8:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(twoEuroLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            case 9:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(oneOneOneEuroLongPress(gesture:)))
                longPress.minimumPressDuration = 0.5
                button.addGestureRecognizer(longPress)
            default:
                break
            }
        }
    }
    
    @objc func oneCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard oneCentCounter != 0 else { return }
                oneCentValue -= 0.50
                oneCentCounter -= 1
                deleteFromTotal(value: 0.50)
                oneCentLabel.text = "1c: \(NSString(format: "%.2f", oneCentValue))€ (\(oneCentCounter))"
        } else if gesture.state == .ended {
            if oneCentCounter == 0 {
                oneCentLabel.text = ""
            }
        }
    }
    
    @objc func twoCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard twoCentCounter != 0 else { return }
            twoCentValue -= 1.00
            twoCentCounter -= 1
            deleteFromTotal(value: 1.00)
            twoCentLabel.text = "2c: \(NSString(format: "%.2f", twoCentValue))€ (\(twoCentCounter))"
        } else if gesture.state == .ended {
            if twoCentCounter == 0 {
                twoCentLabel.text = ""
            }
        }
    }
    
    @objc func fiveCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard fiveCentCounter != 0 else { return }
            fiveCentValue -= 2.50
            fiveCentCounter -= 1
            deleteFromTotal(value: 2.50)
            fiveCentLabel.text = "5c: \(NSString(format: "%.2f", fiveCentValue))€ (\(fiveCentCounter))"
        } else if gesture.state == .ended {
            if fiveCentCounter == 0 {
                fiveCentLabel.text = ""
            }
        }
    }
    
    @objc func tenCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard tenCentCounter != 0 else { return }
            tenCentValue -= 4.00
            tenCentCounter -= 1
            deleteFromTotal(value: 4.00)
            tenCentLabel.text = "10c: \(NSString(format: "%.2f", tenCentValue))€ (\(tenCentCounter))"
        } else if gesture.state == .ended {
            if tenCentCounter == 0 {
                tenCentLabel.text = ""
            }
        }
    }
    
    @objc func twentyCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard twentyCentCounter != 0 else { return }
            twentyCentValue -= 8.00
            twentyCentCounter -= 1
            deleteFromTotal(value: 8.00)
            twentyCentLabel.text = "20c: \(NSString(format: "%.2f", twentyCentValue))€ (\(twentyCentCounter))"
        } else if gesture.state == .ended {
            if twentyCentCounter == 0 {
                twentyCentLabel.text = ""
            }
        }
    }
    
    @objc func fiftyCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard fiftyCentCounter != 0 else { return }
            fiftyCentValue -= 20.00
            fiftyCentCounter -= 1
            deleteFromTotal(value: 20.00)
            fiftyCentLabel.text = "50c: \(NSString(format: "%.2f", fiftyCentValue))€ (\(fiftyCentCounter))"
        } else if gesture.state == .ended {
            if fiftyCentCounter == 0 {
                fiftyCentLabel.text = ""
            }
        }
    }
    
    @objc func oneEuroLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard oneEuroCounter != 0 else { return }
            oneEuroValue -= 25.00
            oneEuroCounter -= 1
            deleteFromTotal(value: 25.00)
            oneEuroLabel.text = "1€: \(NSString(format: "%.2f", oneEuroValue))€ (\(oneEuroCounter))"
        } else if gesture.state == .ended {
            if oneEuroCounter == 0 {
                oneEuroLabel.text = ""
            }
        }
    }
    
    @objc func twoEuroLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard twoEuroCounter != 0 else { return }
            twoEuroValue -= 50.00
            twoEuroCounter -= 1
            deleteFromTotal(value: 50.00)
            twoEuroLabel.text = "2€: \(NSString(format: "%.2f", twoEuroValue))€ (\(twoEuroCounter))"
        } else if gesture.state == .ended {
            if twoEuroCounter == 0 {
                twoEuroLabel.text = ""
            }
        }
    }
    
    @objc func oneOneOneEuroLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {

        }
    }
    
    func addAllOneByOne() {
        oneCentValue += 0.50
        oneCentCounter += 1
        oneCentLabel.text = "1c: \(NSString(format: "%.2f", oneCentValue))€ (\(oneCentCounter))"

        twoCentValue += 1.00
        twoCentCounter += 1
        twoCentLabel.text = "2c: \(NSString(format: "%.2f", twoCentValue))€ (\(twoCentCounter))"

        fiveCentValue += 2.50
        fiveCentCounter += 1
        fiveCentLabel.text = "5c: \(NSString(format: "%.2f", fiveCentValue))€ (\(fiveCentCounter))"

        tenCentValue += 4.00
        tenCentCounter += 1
        tenCentLabel.text = "10c: \(NSString(format: "%.2f", tenCentValue))€ (\(tenCentCounter))"

        twentyCentValue += 8.00
        twentyCentCounter += 1
        twentyCentLabel.text = "20c: \(NSString(format: "%.2f", twentyCentValue))€ (\(twentyCentCounter))"

        fiftyCentValue += 20.00
        fiftyCentCounter += 1
        fiftyCentLabel.text = "50c: \(NSString(format: "%.2f", fiftyCentValue))€ (\(fiftyCentCounter))"

        oneEuroValue += 25.00
        oneEuroCounter += 1
        oneEuroLabel.text = "1€: \(NSString(format: "%.2f", oneEuroValue))€ (\(oneEuroCounter))"
        
        twoEuroValue += 50.00
        twoEuroCounter += 1
        twoEuroLabel.text = "2€: \(NSString(format: "%.2f", twoEuroValue))€ (\(twoEuroCounter))"
    }
}
