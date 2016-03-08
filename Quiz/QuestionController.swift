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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
    

}
