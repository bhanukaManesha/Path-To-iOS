//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButtom: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector : #selector(updateUI), userInfo:nil, repeats: false)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        topButton.setTitle(quizBrain.getAnswers("top"),for: .normal)
        middleButton.setTitle(quizBrain.getAnswers("middle"),for: .normal)
        bottomButtom.setTitle(quizBrain.getAnswers("bottom"),for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        
        
        topButton.backgroundColor = UIColor.clear
        middleButton.backgroundColor = UIColor.clear
        bottomButtom.backgroundColor = UIColor.clear
        
    }


}

