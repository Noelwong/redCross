//
//  PersonalInforViewController.swift
//  FirebaseApp
//
//  Created by Anson on 25/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



class PersonalInforViewController: UIViewController {
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var ChineseNameField: UITextField!
    @IBOutlet weak var HKID: UITextField!
    @IBOutlet weak var DateOfBirth: UIDatePicker!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var bloodGroup: UITextField!
    @IBOutlet weak var donorID: UITextField!
    @IBOutlet weak var whetherDonatedBlood: UISegmentedControl!
    @IBOutlet weak var lastDonationDate: UIDatePicker!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var mobileNo: UITextField!
    @IBOutlet weak var email: UITextField!
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        //DateOfBirth.datePickerMode = UIDatePickerMode.date
        //lastDonationDate.datePickerMode = UIDatePickerMode.date
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtn(_ sender: UIButton) {
        ref = Database.database().reference()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let uid = Auth.auth().currentUser!.uid
        var don = ""
        
        if firstNameField.text != ""{
        ref.child("user").child(uid).child("firstName").setValue(firstNameField.text)
        ref.child("user").child(uid).child("lastName").setValue(lastNameField.text)
        ref.child("user").child(uid).child("chinese_name").setValue(ChineseNameField.text)
        ref.child("user").child(uid).child("HKID").setValue(HKID.text)
            
            let dateOfBirth = formatter.string(from: DateOfBirth.date)
        ref.child("user").child(uid).child("date_brith").setValue(dateOfBirth)
        ref.child("user").child(uid).child("weight").setValue(Weight.text)
        ref.child("user").child(uid).child("height").setValue(Height.text)
        ref.child("user").child(uid).child("blood_group").setValue(bloodGroup.text)
            
            if(whetherDonatedBlood.selectedSegmentIndex == 0){
                don = "yes"
                
            }else{
                don = "no"
            }
        ref.child("user").child(uid).child("whether_donated_blood").setValue(don)
            
            let LastDonationDate = formatter.string(from: lastDonationDate.date)
        ref.child("user").child(uid).child("last_donation_date").setValue(LastDonationDate)
        ref.child("user").child(uid).child("address").setValue(Address.text)
        ref.child("user").child(uid).child("mobile_No").setValue(mobileNo.text)
        ref.child("user").child(uid).child("email").setValue(email.text)
            
        
            
        }
    }
    
}
