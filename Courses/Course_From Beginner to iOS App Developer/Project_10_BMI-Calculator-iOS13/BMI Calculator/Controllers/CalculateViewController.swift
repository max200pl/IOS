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
        
        let bmi = weight / pow(height, 2)
        
        bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
//        let secondVC = SecondViewController()
//        
//        print(String(format: "%.1f", bmi))
//        
//        secondVC.bmiValue = String(format: "%.1", bmi)
//        
//        self.present(secondVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "goToResult" {
            let distinationVC = segue.destination as! ResultViewController
            distinationVC.bmiValue = bmiValue
        }
    }
}
