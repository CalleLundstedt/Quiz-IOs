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
    var quiz: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz = Quiz()
        updateQuestion()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "countDown", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rightAnswer(sender: UIButton) {
        timer.invalidate()
        pointsLabel.text = "\(Int(timeLeft*2))"
        sender.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
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
        questionLabel.text = quiz.questions[0].question
        altOne.setTitle(quiz.questions[0].answers[0].answer, forState: .Normal)
        altTwo.setTitle(quiz.questions[0].answers[1].answer, forState: .Normal)
        altThree.setTitle(quiz.questions[0].answers[2].answer, forState: .Normal)
        altFour.setTitle(quiz.questions[0].answers[3].answer, forState: .Normal)
    }

    
}
