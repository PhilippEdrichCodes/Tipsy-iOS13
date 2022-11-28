//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercentage: Double = 0.10
    var numberOfPeople: Int = 1
    var billTotal: Double = 0.0
    var finalResult: String = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? "15%"
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign) ?? 0.15
        
        tipPercentage = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", locale: .current, stepperValue)
        numberOfPeople = Int(stepperValue)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let bill = billTextField.text ?? "1.0"
        
        self.billTotal = Double(bill) ?? 1.0
        
        let toPayTotal = billTotal * (1 + tipPercentage)
        let oneHasToPay = toPayTotal / Double(numberOfPeople)
        finalResult = String(format: "%.2f", locale: .current, oneHasToPay)
        
        self.performSegue(withIdentifier: "presentResultModally", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentResultModally" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipPercentage = Int(self.tipPercentage * 100)
            destinationVC.numberOfPersons = self.numberOfPeople
            destinationVC.perPerson = self.finalResult
            destinationVC.billTotal = String(format: "%.2f", locale: .current, self.billTotal)
        }
    }
    
}

