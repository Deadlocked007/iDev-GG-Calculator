//
//  ViewController.swift
//  iDev GG Calculator
//
//  Created by Siraj Zaneer on 12/22/16.
//  Copyright © 2016 Siraj Zaneer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cGradeField: UITextField! // TextField containing user's current grade
    @IBOutlet weak var fWeightField: UITextField! // TextField containing the weight of the final exam
    @IBOutlet weak var gGradeField: UITextField! // TextField containing the grade the user wishes to recieve
    @IBOutlet weak var gNeedLabel: UILabel! // Label holding the grade the user needs to receive on the final to get the grade he/she wants
    @IBOutlet weak var errorLabel: UILabel! // Label holding error messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onCalculate(_ sender: Any) {
        /* 
         Here we save the text from each of the fields into string constants using "guard let" because:
         - TextField text is optional
         - Constants allow use to save memory and optimize since we won't be changes the value of the strings
        */
        guard let cGrade = cGradeField.text else {
            errorLabel.text = "Please enter a valid current grade"
            errorLabel.isHidden = false
            return
        }
        
        guard let fWeight = fWeightField.text else {
            errorLabel.text = "Please enter a valid final weight"
            errorLabel.isHidden = false
            return
        }
        
        guard let gGrade = gGradeField.text else {
            errorLabel.text = "Please enter a valid goal grade"
            errorLabel.isHidden = false
            return
        }
        
        // Here we simply cast the values to double and force unwrap them since we know they exist
        let cGradeVal = Double(cGrade)!
        let fWeightVal = Double(fWeight)!
        let gGradeVal = Double(gGrade)!
        
        // Here we calculate the users current unweighted grade before taking the final
        let uWGrade = ((100 - fWeightVal) / 100) * cGradeVal
        
        // Here we calculate the grade the user needs
        let gNeeded = ((gGradeVal - uWGrade) / fWeightVal) * 100
        
        // If the user already has an unweighted grade over or equal to the grade they wish to receive
        if gNeeded <= 0 {
            gNeedLabel.text = "0%"
            errorLabel.text = "Wow you're so cool"
            errorLabel.isHidden = false
            return
        }
        
        // Round the value to two deimal places and put it into labl
        gNeedLabel.text = String(format: "%.2f", gNeeded) + "%"
        errorLabel.isHidden = true
        
        // GG
        if gNeeded > 100 {
            errorLabel.text = "GG"
            errorLabel.isHidden = false
        }
        
    }

}

