//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totaltime: Int = 0
    var secondsPassed: Int = 0
    
    var timer = Timer()
     
    
    @IBAction func hardnessSelectd(_ sender: UIButton) {
        timer.invalidate()
        
        print(sender.currentTitle!)
        
        let hardness = sender.currentTitle!
        
        totaltime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        titleLable.text = hardness;
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totaltime {
            print("Seconds remaining: \(secondsPassed)")
            secondsPassed += 1
            let procentageProgress = Float(secondsPassed) / Float(totaltime)
            
            progressBar.progress = procentageProgress
        } else {
            print("Time's Up!")
            
            timer.invalidate()
            titleLable.text = "Time's Up!"
        }
    }
}
