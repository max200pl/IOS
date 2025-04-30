//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Maksym Poskannyi on 29.04.2025.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?

    @IBOutlet weak var bmiLable: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLable.text = bmiValue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) // Close window
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
