//
//  SettingsViewController.swift
//  TipCalc_annabel
//
//  Created by Annabel Strauss on 6/20/17.
//  Copyright © 2017 Annabel Strauss. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var amountOneField: UITextField!
    @IBOutlet weak var amountTwoField: UITextField!
    @IBOutlet weak var amountThreeField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //save the three new tip percentages
        let defaults = UserDefaults.standard
        defaults.set(Double(amountOneField.text!) ?? 0, forKey: "first_percentage")
        defaults.set(Double(amountTwoField.text!) ?? 0, forKey: "second_percentage")
        defaults.set(Double(amountThreeField.text!) ?? 0, forKey: "third_percentage")
        
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
