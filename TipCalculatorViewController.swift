//
//  TipCalculatorViewController.swift
//  tipCalculator
//
//  Created by Kerlos Saad on 9/4/19.
//  Copyright © 2019 Kirollos Saad. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController{
    @IBOutlet weak var amountBeforeTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmount: UILabel!
    @IBOutlet weak var totalResultLabel: UILabel!
    
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.05)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTextField.becomeFirstResponder()
    }
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPersonAmount.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
        
    }
    //Mark: - Target and Actions
    
    @IBAction func tipSliderValueChanged(sender: Any){
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    @IBAction func peopleSliderValueChanged(senderr: Any){
        numberOfPeopleLabel.text = String(format: "Split / %2d%", Int(numberOfPeopleSlider.value))
        calculateBill()
    }
    @IBAction func amountBeforeTextfieldChanged(sender: Any){
        calculateBill()
    }

}
