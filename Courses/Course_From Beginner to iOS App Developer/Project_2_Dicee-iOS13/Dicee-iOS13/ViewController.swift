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

        let diceArr = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"),  #imageLiteral(resourceName: "DiceSix")];

        imageView1.image = diceArr[Int.random(in: 0...5)]
        imageView2.image = diceArr[Int.random(in: 0...5)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

