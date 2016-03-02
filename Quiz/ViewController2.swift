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
    
    var timer = NSTimer()
    var timeLeft: Float = 10
    var progress: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLeftBar.setProgress(progress, animated: false)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "countDown", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countDown() {
        
        if(timeLeft > 0) {
            timeLeft -= 0.5
            
            progress = timeLeft/10.0
            
            update()
        }
        else {
            timer.invalidate()
        }
    }
    
    func update() {
        timeLeftBar.setProgress(progress, animated: true)
        timeLeftLabel.text = "\(timeLeft)"
    }

    
}
