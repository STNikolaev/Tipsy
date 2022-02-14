//
//  Calculator.swift
//  Tipsy
//
//  Created by Alexandr Nikolaev on 12.02.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct Calculator {
    
    var tips: Tips?
    
    mutating func calculateTips(bill: Float, tip: Float, numberOfPeople: Int) {
        let amountToPay = (bill + bill * tip) / Float(numberOfPeople)
        tips = Tips(tip: tip, numberOfPeople: numberOfPeople, bill: bill, amountToPay: amountToPay)
    }
    
    func getTips(button: String) -> Float {
        let buttonTitleMinusPercentSign =  String(button.dropLast())
        let buttonTitleAsANumber = Float(buttonTitleMinusPercentSign)!
        return buttonTitleAsANumber / 100
    }
    
    func getAmountToPay() -> String {
        return String(format: "%.1f", tips!.amountToPay)
    }
    
    func getSettingsValue() -> String {
        return "Split between \(tips!.numberOfPeople) people, with \(String(format: "%.0f",tips!.tip * 100))% tip."
    }
    
    
    
    
    
}
