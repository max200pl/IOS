//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Roll button pressed!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

