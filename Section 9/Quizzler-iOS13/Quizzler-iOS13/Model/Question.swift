//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Bhanuka Gamage on 11/27/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    
    let text : String
    let answer : [String]
    let correct : String
    
    
    init(q:String, a:[String], correctAnswer:String) {
        text = q
        answer = a
        correct = correctAnswer
    }
    
    
}
