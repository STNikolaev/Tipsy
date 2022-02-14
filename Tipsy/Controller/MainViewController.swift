//
//  MainViewController.swift
//  Tipsy
//
//  Created by Alexandr Nikolaev on 12.02.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var tip: Float = 0.1
    var calculator = Calculator()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let button = sender.currentTitle!
        tip = calculator.getTips(button: button)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text!) ?? 0
        let numberOfPeople = Int(splitLabel.text!) ?? 0
        calculator.calculateTips(bill: bill, tip: tip, numberOfPeople: numberOfPeople)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = calculator.getAmountToPay()
            destinationVC.settings = calculator.getSettingsValue()
        }
    }
}



