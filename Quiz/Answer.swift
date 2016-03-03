//
//  Answer.swift
//  Quiz
//
//  Created by Carl Lundstedt on 03/03/16.
//  Copyright © 2016 Carl Lundstedt. All rights reserved.
//

import Foundation

class Answer {
    var answer: String
    var correct: Bool
    
    init(answer: String, correct: Bool) {
        self.answer = answer
        self.correct = correct
    }
}