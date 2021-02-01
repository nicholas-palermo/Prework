//
//  ViewController.swift
//  Prework
//
//  Created by Nicholas Palermo on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    
    //Creates any neccessary connections with view controller on Main.storyboard
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billPerPersonLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var partySizeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    //action changes partySizeLabel for party size based on partySizeStepper
    @IBAction func partySizeSelection(_ sender: Any) {
        
        partySizeLabel.text = "\(Int(partySizeStepper.value))"
    }
    
    //action uses tipControl to manipulate rateLabel and tip rate
    @IBAction func tipRateSelectionWithSegmentedControl(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.20]                             //creates a constant array for the set of predetermined tip percentages decimal conversions
        let rate = tipPercentages[tipControl.selectedSegmentIndex]          //creates a constant for rate selected by segmented control
        tipSlider.value = Float(rate)                                       //sets the tipSlider to the rate chosen by segmented control
        rateLabel.text = "\(Int(tipSlider.value*100))%"                     //updates rateLabel to chosen segmented control value
    }
    
    //action uses tipSlider
    @IBAction func tipRateSelectionWithSlider(_ sender: Any) {
        rateLabel.text = "\(Int(tipSlider.value*100))%"                     //updates rateLabel to chosen slider value
    }
    
    
    //action calculates the tip and the bill total and splits it by chosen party size
    @IBAction func calculateTip(_ sender: UIButton) {
    
        //generates neccesary constants for inputted bill amount, tip rate, and party size
        let bill = Double(billAmountTextField.text!) ?? 0
        let rate = tipSlider.value
        let partySize = partySizeStepper.value
        
        //performs neccessary computations for tip calculation
        let tip = bill * Double(rate)                                       //calculates tip
        let total = bill + tip                                              //calculates total
        let billPerPerson = total/partySize                                 //divides total by number of party members
        
        
        //Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //Update total amount label
        totalLabel.text = String(format: "$%.2f", total)
        
        //Update bill per person label
        billPerPersonLabel.text = String(format: "$%.2f", billPerPerson)
        
    }
    
    
    
}

