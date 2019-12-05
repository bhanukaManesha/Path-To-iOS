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
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    var tipPercentage : Double = 0.1

    var numberOfSplits : Double = 2.0
    
    var total : Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender == zeroPctButton {
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            zeroPctButton.isSelected = true
            tipPercentage = 0.0
            
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = true
            tipPercentage = 0.1
            
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipPercentage = 0.2
        }
        
        billTextField.endEditing(true)
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        numberOfSplits = Double(sender.value)
        splitNumberLabel.text = String(Int(numberOfSplits))
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
//
//
//
//        let totalPerPerson = (total + (tipPercentage * total)) / numberOfSplits
//
//
//
//
//        print(String(format : "%.1f" , totalPerPerson))
  
    }
    
    func calculateTotalPerPerson(numberOfSplits : Double, tipPercentage : Double) -> Double {
        total = Double(billTextField.text!) ?? 0.0
        return (total + (tipPercentage * total)) / numberOfSplits
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipPercentage = tipPercentage
            destinationVC.numberOfSplits = numberOfSplits
            destinationVC.total = calculateTotalPerPerson(numberOfSplits: numberOfSplits, tipPercentage: tipPercentage)
               
        }
    }
}

