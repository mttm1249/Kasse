//
//  RecordModel.swift
//  Kasse
//
//  Created by Денис on 04.12.2022.
//

import UIKit
import RealmSwift

class RecordModel: Object {
    
    // history record information
    @Persisted var date: String?
    @Persisted var totalCoins: String?
    @Persisted var totalPaper: String?
    @Persisted var generallyTotall: String?
    
    // coins
    @Persisted var oneCent: String?
    @Persisted var oneCentResult: String?
    @Persisted var twoCent: String?
    @Persisted var twoCentResult: String?
    @Persisted var fiveCent: String?
    @Persisted var fiveCentResult: String?
    @Persisted var tenCent: String?
    @Persisted var tenCentResult: String?
    @Persisted var twentyCent: String?
    @Persisted var twentyCentResult: String?
    @Persisted var fiftyCent: String?
    @Persisted var fiftyCentResult: String?
    @Persisted var oneEuro: String?
    @Persisted var oneEuroResult: String?
    @Persisted var twoEuro: String?
    @Persisted var twoEuroResult: String?
    
    //paper
    @Persisted var fiveEuro: String?
    @Persisted var fiveEuroResult: String?
    @Persisted var tenEuro: String?
    @Persisted var tenEuroResult: String?
    @Persisted var twentyEuro: String?
    @Persisted var twentyEuroResult: String?
    @Persisted var fiftyEuro: String?
    @Persisted var fiftyEuroResult: String?
    @Persisted var hundredEuro: String?
    @Persisted var hundredEuroResult: String?
    @Persisted var twoHundredEuro: String?
    @Persisted var twoHundredEuroResult: String?
    
    convenience init(date: String,
                     totalCoins: String?,
                     totalPaper: String?,
                     generallyTotall: String?,
                     oneCent: String?,
                     oneCentResult: String?,
                     twoCent: String?,
                     twoCentResult: String?,
                     fiveCent: String?,
                     fiveCentResult: String?,
                     tenCent: String?,
                     tenCentResult: String?,
                     twentyCent: String?,
                     twentyCentResult: String?,
                     fiftyCent: String?,
                     fiftyCentResult: String?,
                     oneEuro: String?,
                     oneEuroResult: String?,
                     twoEuro: String?,
                     twoEuroResult: String?,
                     fiveEuro: String?,
                     fiveEuroResult: String?,
                     tenEuro: String?,
                     tenEuroResult: String?,
                     twentyEuro: String?,
                     twentyEuroResult: String?,
                     fiftyEuro: String?,
                     fiftyEuroResult: String?,
                     hundredEuro: String?,
                     hundredEuroResult: String?,
                     twoHundredEuro: String?,
                     twoHundredEuroResult: String?) {
        self.init()
        self.date = date
        self.totalCoins = totalCoins
        self.totalPaper = totalPaper
        self.generallyTotall = generallyTotall
        self.oneCent = oneCent
        self.oneCentResult = oneCentResult
        self.twoCent = twoCent
        self.twoCentResult = twoCentResult
        self.fiveCent = fiveCent
        self.fiveCentResult = fiveCentResult
        self.tenCent = tenCent
        self.tenCentResult = tenCentResult
        self.twentyCent = twentyCent
        self.twentyCentResult = twentyCentResult
        self.fiftyCent = fiftyCent
        self.fiftyCentResult = fiftyCentResult
        self.oneEuro = oneEuro
        self.oneEuroResult = oneEuroResult
        self.twoEuro = twoEuro
        self.twoEuroResult = twoEuroResult
        self.fiveEuro = fiveEuro
        self.fiveEuroResult = fiveEuroResult
        self.tenEuro = tenEuro
        self.tenEuroResult = tenEuroResult
        self.twentyEuro = twentyEuro
        self.twentyEuroResult = twentyEuroResult
        self.fiftyEuro = fiftyEuro
        self.fiftyEuroResult = fiftyEuroResult
        self.hundredEuro = hundredEuro
        self.hundredEuroResult = hundredEuroResult
        self.twoHundredEuro = twoHundredEuro
        self.twoHundredEuroResult = twoHundredEuroResult
    }
}
