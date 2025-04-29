//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        var height = String(format: "%.2f", sender.value)
    
        heightLable.text = "\(height) m"
    }

    @IBAction func weightSliderChange(_ sender: UISlider) {
        var weight = String(format: "%.0f", sender.value)
    
        weightLable.text = "\(weight) kg"
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        let bmi = weight / pow(height, 2)
        
        let resultText = String(format: "%.2f", bmi) 
    }
}

