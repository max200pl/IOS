//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLable: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var cointManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cointManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {

    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLable.text = currency
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
}

//MARK: - UIPickerView DataSource & Delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cointManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cointManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(cointManager.currencyArray[row])
        
        let selectCurency = cointManager.currencyArray[row]
        
        cointManager.getCoinPrice(for: selectCurency)
    }
}

