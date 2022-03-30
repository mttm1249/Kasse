//
//  MainCalculator.swift
//  coins
//
//  Created by Денис on 19.03.2022.
//

import Foundation

final class MainCalculator {
        
   static var coins: Double! {
        get {
            UserDefaults.standard.double(forKey: "coins")
        } set {
            let defaults = UserDefaults.standard
            let key = "coins"
            if let coin = newValue {
                print("value \(NSString(format: "%.2f", coin))€ was added to key \(key)")
                defaults.set(coin, forKey: key)
            } else {
                defaults
                    .removeObject(forKey: key)
            }
        }
    }
    
    static var paper: Double! {
         get {
             UserDefaults.standard.double(forKey: "paper")
         } set {
             let defaults = UserDefaults.standard
             let key = "paper"
             if let paper = newValue {
                 print("value \(NSString(format: "%.2f", paper))€ was added to key \(key)")
                 defaults.set(paper, forKey: key)
             } else {
                 defaults
                     .removeObject(forKey: key)
             }
         }
     }
    
    static var detailInfoCoins: String! {
         get {
             UserDefaults.standard.string(forKey: "detailInfoCoins")
         } set {
             let defaults = UserDefaults.standard
             let key = "detailInfoCoins"
             if let detailInfoCoins = newValue {
                 print("Detail string was added to key \(key)")
                 defaults.set(detailInfoCoins, forKey: key)
             } else {
                 defaults
                     .removeObject(forKey: key)
             }
         }
     }
    
    static var detailInfoPaper: String! {
         get {
             UserDefaults.standard.string(forKey: "detailInfoPaper")
         } set {
             let defaults = UserDefaults.standard
             let key = "detailInfoPaper"
             if let detailInfoPaper = newValue {
                 print("Detail string was added to key \(key)")
                 defaults.set(detailInfoPaper, forKey: key)
             } else {
                 defaults
                     .removeObject(forKey: key)
             }
         }
     }
}
