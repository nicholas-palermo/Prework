//
//  ViewController.swift
//  Prework
//
//  Created by Nicholas Palermo on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billPerPersonLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var partySizeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func partySizeSelection(_ sender: Any) {
        
        partySizeLabel.text = "\(Int(partySizeStepper.value))"
    }
    
    @IBAction func tipRateSelection(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.20]
        let rate = tipPercentages[tipControl.selectedSegmentIndex]
        rateSlider.value = Float(rate)
        rateLabel.text = "\(Int(rateSlider.value*100))%"
    }
    
    @IBAction func tipRateSelectionWithSlider(_ sender: Any) {
        rateLabel.text = "\(Int(rateSlider.value*100))%"
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
    // Retreive bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let rate = rateSlider.value
        
        
        let partySize = partySizeStepper.value
        
        let tip = bill * Double(rate)
        let total = bill + tip
        let billPerPerson = total/partySize
        
        
        //Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //Update total amount label
        totalLabel.text = String(format: "$%.2f", total)
        
        //Update bill per person label
        billPerPersonLabel.text = String(format: "$%.2f", billPerPerson)
        
    }
    
    
    
}

