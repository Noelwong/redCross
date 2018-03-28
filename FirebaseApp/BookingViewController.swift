//
//  BookingViewController.swift
//  FirebaseApp
//
//  Created by Wong Hok Lam on 28/3/2018.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class BookingViewController: UIViewController, UIPickerViewDataSource,
UIPickerViewDelegate {

    @IBOutlet weak var bcpicker2: UIPickerView!
    
 
    
    @IBOutlet weak var date1: UIDatePicker!
    var ref:DatabaseReference!
    
    var bcname = ["Select",
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""]
    
    
    override func viewDidLoad() {
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        bcpicker2.delegate = self
        bcpicker2.dataSource = self
      
        ref = Database.database().reference()
        ref.child("peopleflow").observeSingleEvent(of: .value, with: { (snapshot) in
            var count = 0
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                print("key = \(key)  value = \(value!)")
                self.bcname[count] = "\(key)"
                count += 1
            }
        })
          super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return bcname.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bcname[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
}
    
    @IBAction func submit(_ sender: UIButton) {
         ref = Database.database().reference()
          let uid = Auth.auth().currentUser!.uid
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
         let date2 = formatter.string(from: date1.date)
        ref.child("user").child(uid).child("booking").child("DateAndTime").setValue(date2)
    }
    
    
}
