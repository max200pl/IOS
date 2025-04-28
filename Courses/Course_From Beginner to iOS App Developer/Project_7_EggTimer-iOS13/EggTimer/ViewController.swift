//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 10, "Hard": 15]
     
    
    @IBAction func hardnessSelectd(_ sender: UIButton) {
        print(sender.currentTitle!)
    
        var hardness: Int!
        
        switch sender.currentTitle! {
        case "Soft":
            hardness = eggTimes["Soft"]
        case "Medium":
            hardness = eggTimes["Medium"]
        case "Hard":
            hardness = eggTimes["Hard"]
        default:
            break
        }
        
        print(hardness as Int)
    }
}
