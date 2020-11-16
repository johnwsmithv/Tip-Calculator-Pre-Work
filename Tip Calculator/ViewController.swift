//
//  ViewController.swift
//  Tip Calculator
//
//  Created by John W. Smith V on 11/14/20.
//  First ever Swift Program
//  This program is able to calculate the amount the person is going to tip and the bill is able to be split among multiple people
//

import UIKit

var numPeople = 1.0;

class ViewController: UIViewController {
    
    // Elements of the screen that I want to configure
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var numberOfPeoplePicker: UIPickerView!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    // Array for the Total # of people that are going to be splitting the bill
    let peopleArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    let tipPercentageArray = [0.15, 0.18, 0.20]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPeoplePicker.dataSource = self
        numberOfPeoplePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        /*billField.text = String(format: "$%.2f", Double(billField.text!)!)*/
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount, get the percentage tip, and then update the label for the total that the people are going to need to pay
        // Bill temp variable | If it isn't valid the num is 0
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentageArray[tipControl.selectedSegmentIndex]
        
        let total = tip + bill
        
        let perPerson = total / numPeople
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPerson.text = String(format: "$%.2f", perPerson)
    }
}

// The point of these functions is to be able to get a Picker workking properly so the user is able to pick how many people are going to be splitting the bill
extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number so of rows in the picker corresponds to the number of elements in the array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return peopleArray.count
    }
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return peopleArray[row]
    }
    // The point of this function is to be able to grab the numbe of people that the user picked and then recalculate the total per person
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numPeople = Double(peopleArray[row])!
        print(numPeople)
        calculateTip(0)
    }
    
    
}
