//
//  Question.swift
//  Quiz
//
//  Created by Carl Lundstedt on 03/03/16.
//  Copyright © 2016 Carl Lundstedt. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var answers: [Answer]
    
    init(question: String, answers: [Answer]) {
        self.question = question
        self.answers = answers
    }
}