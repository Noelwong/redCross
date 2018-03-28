//
//  personal_InfoViewController.swift
//  FirebaseApp
//
//  Created by Wong Hok Lam on 26/3/2018.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit
import FirebaseDatabase

class personal_InfoViewController: UIViewController {
    var rootRef =  Database.database().reference()
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBAction func submitBtn(_ sender: Any) {
        rootRef = Database.database().reference()
        if firstNameField.text != ""{
             rootRef.child("User").childByAutoId().setValue(firstNameField.text)
        }
       
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
