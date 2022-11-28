//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Philipp Edrich on 28.11.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var perPerson: String?
    var numberOfPersons: Int?
    var tipPercentage: Int?
    var billTotal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        perPersonLabel.text = perPerson
        settingsLabel.text = "Split \(billTotal ?? "0.00") between \(numberOfPersons ?? 1) people, with \(tipPercentage ?? 0)% tip"
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
