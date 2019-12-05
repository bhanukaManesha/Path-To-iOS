//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bhanuka Gamage on 12/5/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    var tipPercentage : Double = 0.0
    var numberOfSplits : Double = 2.0
    var total : Double = 0.0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format:"%.2f" , total)
        settingsLabel.text = "Split between \(Int(numberOfSplits)) people, with \(Int(tipPercentage * 100))% tip"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
