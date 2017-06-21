//
//  ViewController.swift
//  TipCalc_annabel
//
//  Created by Annabel Strauss on 6/20/17.
//  Copyright © 2017 Annabel Strauss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoPplLabel: UILabel!
    @IBOutlet weak var threePplLabel: UILabel!
    @IBOutlet weak var fourPplLabel: UILabel!
    var tipPercentages = [0.15, 0.18, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipOneValue = defaults.double(forKey: "first_percentage")
        let tipTwoValue = defaults.double(forKey: "second_percentage")
        let tipThreeValue = defaults.double(forKey: "third_percentage")
        
        tipPercentages = [tipOneValue, tipTwoValue, tipThreeValue]

        tipControl.setTitle(String(tipOneValue), forSegmentAt: 0)
        tipControl.setTitle(String(tipTwoValue), forSegmentAt: 1)
        tipControl.setTitle(String(tipThreeValue), forSegmentAt: 2)

    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100
        let total = bill + tip
        
        let twoppl = total/2.0
        let threeppl = total/3.0
        let fourppl = total/4.0
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        twoPplLabel.text = String(format: "$%.2f", twoppl)
        threePplLabel.text = String(format: "$%.2f", threeppl)
        fourPplLabel.text = String(format: "$%.2f", fourppl)
    }
    
}

