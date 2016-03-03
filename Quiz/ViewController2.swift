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
    
    
    var timer = NSTimer()
    var timeLeft: Float = 10
    var progress: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLeftBar.setProgress(progress, animated: false)
        
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

    
}
