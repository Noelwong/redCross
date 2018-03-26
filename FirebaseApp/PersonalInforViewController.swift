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
    
    @IBOutlet weak var ChineseNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    var ref = Database.database().reference()
    
    
    @IBOutlet weak var lastNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
  
    @IBAction func submitBtn(_ sender: UIButton) {
        ref = Database.database().reference()
       let uid = Auth.auth().currentUser!.uid
        
        if firstNameField.text != ""{
            ref.child("user").child(uid).child("firstName").setValue(firstNameField.text)
             ref.child("user").child(uid).child("lastName").setValue(lastNameField.text)
                ref.child("user").child(uid).child("chinese_name").setValue(ChineseNameField.text)
                ref.child("user").child(uid).child("HKID").setValue(ChineseNameField.text)
                    }
    }
    
}
