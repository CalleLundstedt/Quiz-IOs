//
//  Quiz.swift
//  Quiz
//
//  Created by Carl Lundstedt on 03/03/16.
//  Copyright © 2016 Carl Lundstedt. All rights reserved.
//

import Foundation

class Quiz {
    
    var points: Int
    var questions: [Question]
    
    init() {
        points = 0
        questions = []
        questions.append(Question(question: "Vad heter Calle?", answers: [Answer(answer: "Calle", correct: true), Answer(answer: "Svett", correct: false), Answer(answer: "Heh", correct: false), Answer(answer: "Huh", correct: false)]))
        
        questions.append(Question(question: "Vad heter Mallan af Brallan?", answers: [Answer(answer: "Calle", correct: false), Answer(answer: "Mulrisabethin", correct: true), Answer(answer: "Wabuu", correct: false), Answer(answer: "Snork", correct: false)]))
    }
    
    func returnQuestions() -> [Question] {
        return questions
    }
}