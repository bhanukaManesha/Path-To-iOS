//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    
    let listOfDice = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        // Naive way of getting the random value
        diceImageView1.image = listOfDice[Int.random(in:0...5)]
        diceImageView2.image = listOfDice[Int.random(in:0...5)]
        
        // Better Approach
        diceImageView1.image = listOfDice.randomElement()
        diceImageView2.image = listOfDice.randomElement()
        
    }
    
}

