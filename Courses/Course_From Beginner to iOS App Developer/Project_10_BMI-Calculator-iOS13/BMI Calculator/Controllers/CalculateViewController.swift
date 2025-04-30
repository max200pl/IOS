//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    var bmiValue = "0.0"
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
    
        heightLable.text = "\(height) m"
    }

    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
    
        weightLable.text = "\(weight) kg"
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        
        calculateBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        if segue.identifier == "goToResult" {
            let distinationVC = segue.destination as! ResultViewController
            distinationVC.bmiValue = calculateBrain.getBMIValue()
            
            distinationVC.advice = calculateBrain.getAdvice()
            distinationVC.color = calculateBrain.getColor()
        }
    }
}
