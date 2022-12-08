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
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 2:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(twoCentLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 3:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(fiveCentLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 4:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(tenCentLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 5:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(twentyCentLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 6:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(fiftyCentLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 7:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(oneEuroLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 8:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(twoEuroLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            case 9:
                let longPress = UILongPressGestureRecognizer(target: self, action: #selector(oneOneOneEuroLongPress(gesture:)))
                longPress.minimumPressDuration = 1
                button.addGestureRecognizer(longPress)
            default:
                break
            }
        }
    }
    
    @objc func oneCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard oneCentCounter != 0 else { return }
            oneCentValue -= 0.50
            oneCentCounter -= 1
            deleteFromTotal(value: 0.50)
            oneCentLabel.text = "1c: \(NSString(format: "%.2f", oneCentValue))€ (\(oneCentCounter))"
        }
    }
    
    @objc func twoCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard twoCentCounter != 0 else { return }
            twoCentValue -= 1.00
            twoCentCounter -= 1
            deleteFromTotal(value: 1.00)
            twoCentLabel.text = "2c: \(NSString(format: "%.2f", twoCentValue))€ (\(twoCentCounter))"
        }
    }
    
    @objc func fiveCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard fiveCentCounter != 0 else { return }
            fiveCentValue -= 2.50
            fiveCentCounter -= 1
            deleteFromTotal(value: 2.50)
            fiveCentLabel.text = "5c: \(NSString(format: "%.2f", fiveCentValue))€ (\(fiveCentCounter))"
        }
    }
    
    @objc func tenCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard tenCentCounter != 0 else { return }
            tenCentValue -= 4.00
            tenCentCounter -= 1
            deleteFromTotal(value: 4.00)
            tenCentLabel.text = "10c: \(NSString(format: "%.2f", tenCentValue))€ (\(tenCentCounter))"
        }
    }
    
    @objc func twentyCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard twentyCentCounter != 0 else { return }
            twentyCentValue -= 8.00
            twentyCentCounter -= 1
            deleteFromTotal(value: 8.00)
            twentyCentLabel.text = "20c: \(NSString(format: "%.2f", twentyCentValue))€ (\(twentyCentCounter))"
        }
    }
    
    @objc func fiftyCentLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard fiftyCentCounter != 0 else { return }
            fiftyCentValue -= 20.00
            fiftyCentCounter -= 1
            deleteFromTotal(value: 20.00)
            fiftyCentLabel.text = "50c: \(NSString(format: "%.2f", fiftyCentValue))€ (\(fiftyCentCounter))"
        }
    }
    
    @objc func oneEuroLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard oneEuroCounter != 0 else { return }
            oneEuroValue -= 25.00
            oneEuroCounter -= 1
            deleteFromTotal(value: 25.00)
            oneEuroLabel.text = "1€: \(NSString(format: "%.2f", oneEuroValue))€ (\(oneEuroCounter))"
        }
    }
    
    @objc func twoEuroLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard twoEuroCounter != 0 else { return }
            twoEuroValue -= 50.00
            twoEuroCounter -= 1
            deleteFromTotal(value: 50.00)
            twoEuroLabel.text = "2€: \(NSString(format: "%.2f", twoEuroValue))€ (\(twoEuroCounter))"
        }
    }
    
    @objc func oneOneOneEuroLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            guard oneOneOneEuroCounter != 0 else { return }
            oneOneOneEuroValue -= 111.00
            oneOneOneEuroCounter -= 1
            deleteFromTotal(value: 50.00)
            hundredEuroLabel.text = "111€: \(NSString(format: "%.2f", oneOneOneEuroValue))€ (\(oneOneOneEuroCounter))"
        }
    }
}
