//
//  ViewController.swift
//  Quiz
//
//  Created by Carl Lundstedt on 02/03/16.
//  Copyright © 2016 Carl Lundstedt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quiz: Quiz = Quiz()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "question" {
            
            if let questionController = segue.destinationViewController as? QuestionController {
                
                questionController.quiz = self.quiz
            }
            
        }
        
        if segue.identifier == "game" {
            if let gameController = segue.destinationViewController as? QuizController {
                
                gameController.quiz = self.quiz
            }
        }
        
    }

}

