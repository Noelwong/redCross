//
//  PersonalInforViewController.swift
//  FirebaseApp
//
//  Created by Anson on 25/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit
import Firebase

class PersonalInforViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var ChineseNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
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

    override func viewDidLoad() {
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        super.viewDidLoad()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([doneButton], animated: false)
        lastNameField.inputAccessoryView = toolbar
        ChineseNameField.inputAccessoryView = toolbar
        firstNameField.inputAccessoryView = toolbar
        HKID.inputAccessoryView = toolbar
        Weight.inputAccessoryView = toolbar
        Height.inputAccessoryView = toolbar
        bloodGroup.inputAccessoryView = toolbar
        donorID.inputAccessoryView = toolbar
        Address.inputAccessoryView = toolbar
        mobileNo.inputAccessoryView = toolbar
        email.inputAccessoryView = toolbar


        // Do any additional setup after loading the view.
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        ref = Database.database().reference()
        
        let uid = Auth.auth().currentUser!.uid
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        var don = ""
        // check error message
        var showError = 0
        var showErrorMessage = ""
        
        if firstNameField.text != "" && lastNameField.text != "" {
            showError += 0
        } else {
            showError += 1
            showErrorMessage += "Please Input First Name & Last Name \n"
        }
        
        if isValidHKID(checkHKID: HKID.text!) {
            showError += 0
        } else {
            showError += 1
            showErrorMessage += "Please Input Correct HKID \n"
        }
        if Weight.text != "" && Height.text != "" {
            showError += 0
            } else {
            showError += 1
            showErrorMessage += "Please Input Weight & Height \n"
        }
        if bloodGroup.text == "" || bloodGroup.text == "A" || bloodGroup.text == "B" || bloodGroup.text == "AB" || bloodGroup.text == "O" {
            showError += 0
        } else {
            showError += 1
            showErrorMessage += "Please Input Correct Blood Group(A/B/AB/O) \n"
        }
        
        if donorID.text == "" || isValidDonorID(checkDonorID: donorID.text!) {
            showError += 0
        } else {
            showError += 1
            showErrorMessage += "Please Input Correct Donor ID \n"
        }
        if Address.text != "" {
            showError += 0
        } else {
            showError += 1
            showErrorMessage += "Please Input Correct Address \n"
        }
        
        if isValidPhone(checkPhone: mobileNo.text!) {
            showError += 0
        } else {
            showError += 1
            showErrorMessage += "Please Input Correct Phone Number \n"
        }
        
        if isValidEmail(checkEmail: email.text!) {
            showError += 0
        } else {
            showError += 1
            showErrorMessage += "Please Input Correct Email \n"
        }
        // Update Information or show Error Message
        if showError != 0 {
            // show message box
            let alert = UIAlertController(title: "Failed", message: showErrorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            ref.child("user").child(uid).child("firstName").setValue(firstNameField.text)
            ref.child("user").child(uid).child("lastName").setValue(lastNameField.text)
            ref.child("user").child(uid).child("chinese_name").setValue(ChineseNameField.text)
            ref.child("user").child(uid).child("HKID").setValue(HKID.text)
        
            let dateOfBirth = formatter.string(from: DateOfBirth.date)
            ref.child("user").child(uid).child("date_brith").setValue(dateOfBirth)
            ref.child("user").child(uid).child("weight").setValue(Weight.text)
            ref.child("user").child(uid).child("height").setValue(Height.text)
            ref.child("user").child(uid).child("blood_group").setValue(bloodGroup.text)
            ref.child("user").child(uid).child("Donor ID").setValue(donorID.text)
        
            if(whetherDonatedBlood.selectedSegmentIndex == 0){
                don = "true"
            }else{
                don = "false"
            }
            ref.child("user").child(uid).child("whether_donated_blood").setValue(don)
            let LastDonationDate = formatter.string(from: lastDonationDate.date)
            ref.child("user").child(uid).child("last_donation_date").setValue(LastDonationDate)
            ref.child("user").child(uid).child("address").setValue(Address.text)
            ref.child("user").child(uid).child("mobile_No").setValue(mobileNo.text)
            ref.child("user").child(uid).child("email").setValue(email.text)
            // show message box
            let alert = UIAlertController(title: "Congratulations", message: "Success to Update.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func isValidHKID(checkHKID: String) -> Bool {
        let HKIDRegEx = "[A-Z0-9a-z]{7,8}"
        let HKIDTest = NSPredicate(format:"SELF MATCHES %@", HKIDRegEx)
        return HKIDTest.evaluate(with: checkHKID)
    }
    func isValidDonorID(checkDonorID: String) -> Bool {
        let DonorIDRegEx = "[0-9]{7}"
        let DonorIDTest = NSPredicate(format:"SELF MATCHES %@", DonorIDRegEx)
        return DonorIDTest.evaluate(with: checkDonorID)
    }
    func isValidPhone(checkPhone: String) -> Bool {
        let PhoneRegEx = "[0-9]{8}"
        let PhoneTest = NSPredicate(format:"SELF MATCHES %@", PhoneRegEx)
        return PhoneTest.evaluate(with: checkPhone)
    }
    func isValidEmail(checkEmail: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: checkEmail)
    }
    
}
