//
//  DateCalculateViewController.swift
//  FirebaseApp
//
//  Created by Anson on 15/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit

class DateCalculateViewController: UIViewController {

 
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var GenderSelect: UISegmentedControl!
    @IBOutlet weak var LastType: UISegmentedControl!
    @IBOutlet weak var NextType: UISegmentedControl!
    
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createDatePicker()
    }
    
    func createDatePicker(){
        //toolbal
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button for toolbar
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
        
        dateField.text = "\(dateString)"
        self.view.endEditing(true)
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
