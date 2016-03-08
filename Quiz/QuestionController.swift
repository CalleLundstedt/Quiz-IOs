//
//  QuestionController.swift
//  Quiz
//
//  Created by Carl Lundstedt on 08/03/16.
//  Copyright © 2016 Carl Lundstedt. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {
    
    @IBOutlet weak var correctSwitch1: UISwitch!
    @IBOutlet weak var correctSwitch2: UISwitch!
    @IBOutlet weak var correctSwitch3: UISwitch!
    @IBOutlet weak var correctSwitch4: UISwitch!
    @IBOutlet weak var questionView: UITextView!
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var answer4: UITextField!
    
    var quiz: Quiz?
    var switches: [UISwitch] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switches = [correctSwitch1,correctSwitch2,correctSwitch3,correctSwitch4]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "main" {
            
            if let mainController = segue.destinationViewController as? ViewController {
                
                mainController.quiz = self.quiz!
            }
            
        }
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        if(sender.on) {
            for correctSwitch in switches {
                if(correctSwitch.on && correctSwitch != sender) {
                    correctSwitch.setOn(false, animated: true)
                }
            }
        }
    }
    
    @IBAction func saveQuestion() {
        let question = Question(question: questionView.text, answers: [Answer(answer: answer1.text!, correct: correctSwitch1.on), Answer(answer: answer2.text!, correct: correctSwitch2.on),Answer(answer: answer3.text!, correct: correctSwitch3.on),Answer(answer: answer4.text!, correct: correctSwitch4.on)])
        
        quiz?.questions.append(question)
        print(quiz?.questions.count)
    }
    

}
