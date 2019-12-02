//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = [
        "Soft" : 5*60,
        "Medium" : 7*60,
        "Hard" : 12*60
    ]
    
    var secondsPassed = 0
    var currentTotalSeconds = 0
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        currentTotalSeconds = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if(secondsPassed < currentTotalSeconds) {
            
            
            secondsPassed+=1
            
            let percentageProgress = Float(Float(secondsPassed)/Float(currentTotalSeconds))
            
            print(percentageProgress)
            
            progressBar.progress = percentageProgress
            
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
            
            
            
        }
        
        
        
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)

        player.play()
    
    }
    

}
