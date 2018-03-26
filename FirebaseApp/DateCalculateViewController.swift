//
//  DateCalculateViewController.swift
//  FirebaseApp
//
//  Created by Anson on 25/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit

class DateCalculateViewController: UIViewController {

    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var Age: UISegmentedControl!
    
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var lastDon: UISegmentedControl!
    @IBOutlet weak var NextDon: UISegmentedControl!
    @IBOutlet weak var nextDate: UILabel!
    let picker = UIDatePicker()
    var lastDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        creatDatePicker()
    }

    func creatDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button for toolbar
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        dateField.inputAccessoryView = toolbar
        dateField.inputView = picker
        
        //format picker for date
        picker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        //format date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let dateString = formatter.string(from: picker.date)
        lastDate = picker.date
        dateField.text = "\(dateString)"
        
        self.view.endEditing(true)
    }
    @IBAction func calculate(_ sender: UIButton) {
        if (Age.selectedSegmentIndex == 1)&&(lastDon.selectedSegmentIndex == 1)||(Age.selectedSegmentIndex == 1)&&(NextDon.selectedSegmentIndex == 1){
            // create the alert
            let alert = UIAlertController(title: "Sorry", message: "Among16 to 17 ingredients they can not donate blood", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if(Age.selectedSegmentIndex == 0)&&(lastDon.selectedSegmentIndex == 1){
            let monthsToAdd = 2
            let daysToAdd = 1
            let yearsToAdd = 1
            
            var dateComponent = DateComponents()
            
            dateComponent.month = monthsToAdd
            dateComponent.day = daysToAdd
            dateComponent.year = yearsToAdd
            
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: lastDate)
            let futureDateinStr = formatter.string(from: futureDate!)
            nextDate.text = futureDateinStr
            
            
    }
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
