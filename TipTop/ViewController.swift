//
//  ViewController.swift
//  TipMaster
//
//  Created by Kumawat, Diwakar on 3/20/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        recalc()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let userPercentageSelection = defaults.integer(forKey: "userPercentageSelection")
        tipControl.selectedSegmentIndex = userPercentageSelection
        recalc()
    }
    
    func recalc() {
        let tipPercent = [0.15, 0.20, 0.25]
        let bill = Double(billLabel.text!) ?? 0
        let tip = tipPercent[tipControl.selectedSegmentIndex] * bill
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

