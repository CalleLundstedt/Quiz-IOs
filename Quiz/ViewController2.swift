//
//  ViewController2.swift
//  Quiz
//
//  Created by Carl Lundstedt on 02/03/16.
//  Copyright © 2016 Carl Lundstedt. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var timeLeftBar: UIProgressView!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var altOne: UIButton!
    @IBOutlet weak var altTwo: UIButton!
    @IBOutlet weak var altThree: UIButton!
    @IBOutlet weak var altFour: UIButton!
    
    
    var timer = NSTimer()
    var timeLeft: Float = 10
    var progress: Float = 1.0
    var currentQuestion: Int = 0
    var quiz: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz = Quiz()
        updateQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        if(timer.valid) {
            timer.invalidate()
            if(sender == altOne) {
                if(quiz.questions[currentQuestion].answers[0].correct){
                    altOne.backgroundColor = UIColor.greenColor()
                    quiz.points += Int(timeLeftBar.progress*10)
                    currentQuestion++
                } else {
                    altOne.backgroundColor = UIColor.redColor()
                }
            }
            if(sender == altTwo) {
                if(quiz.questions[currentQuestion].answers[1].correct){
                    altOne.backgroundColor = UIColor.greenColor()
                    quiz.points += Int(timeLeftBar.progress*10)
                    currentQuestion++
                } else {
                    altOne.backgroundColor = UIColor.redColor()
                }
            }
            if(sender == altThree) {
                if(quiz.questions[currentQuestion].answers[2].correct){
                    altOne.backgroundColor = UIColor.greenColor()
                    quiz.points += Int(timeLeftBar.progress*10)
                    currentQuestion++
                } else {
                    altOne.backgroundColor = UIColor.redColor()
                }
            }
            if(sender == altFour) {
                if(quiz.questions[currentQuestion].answers[3].correct){
                    altOne.backgroundColor = UIColor.greenColor()
                    quiz.points += Int(timeLeftBar.progress*10)
                    currentQuestion++
                } else {
                    altOne.backgroundColor = UIColor.redColor()
                }
            }
            updateQuestion()

        }
    }
    
    
    func countDown() {
        
        timeLeft -= 0.1
            
        progress = timeLeft/10.0
            
        update()
        if(timeLeft <= 0) {
            timer.invalidate()
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("MainMenu")
            self.presentViewController(nextViewController, animated:true, completion:nil)
        }
    }
    
    func update() {
        timeLeftBar.setProgress(progress, animated: true)
        if(timeLeft%1 < 0.1){
            timeLeftLabel.text = "\(Int(timeLeft))"
        }
    }
    
    func updateQuestion(){
        pointsLabel.text = "\(quiz.points)"
        questionLabel.text = quiz.questions[currentQuestion].question
        altOne.setTitle(quiz.questions[currentQuestion].answers[0].answer, forState: .Normal)
        altTwo.setTitle(quiz.questions[currentQuestion].answers[1].answer, forState: .Normal)
        altThree.setTitle(quiz.questions[currentQuestion].answers[2].answer, forState: .Normal)
        altFour.setTitle(quiz.questions[currentQuestion].answers[3].answer, forState: .Normal)
        startTimer()
    }
    
    func startTimer() {
        timeLeft = 10
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "countDown", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
}
