//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var secondsRemaining: Int = 60
    
    var timer = Timer()
     
    
    @IBAction func hardnessSelectd(_ sender: UIButton) {
        timer.invalidate()
        
        print(sender.currentTitle!)
        
        let hardness = sender.currentTitle!
        
        let result = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
      
         
        print(result)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("Seconds remaining: \(secondsRemaining)")
            
            secondsRemaining -= 1
        } else {
            print("Time's Up!")
            
            timer.invalidate()
            titleLable.text = "Time's Up!"
        }
    }
}


