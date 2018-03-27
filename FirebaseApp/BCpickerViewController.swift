//
//  BCpickerViewController.swift
//  FirebaseApp
//
//  Created by Shing Fung Lo on 26/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit
import Firebase



class BCpickerViewController: UIViewController , UIPickerViewDataSource,
    UIPickerViewDelegate{

    @IBOutlet weak var bcpicker: UIPickerView!
    
    @IBOutlet weak var peopleflow: UILabel!
    
    var ref:DatabaseReference!
    
    var bcname = ["Headquarters Donor Centre",
                     "West Kowloon Donor Centre",
                     "Mongkok Donor Centre",
                     "Kwun Tong Donor Centre",
                     "Central District Donor Centre",
                     "Causeway Bay Donor Centre",
                     "Shatin Donor Centre",
                     "Tsuen Wan Donor Centre",
                     "Yuen Long Donor Centre",
                     "The Hong Kong Polytechnic University Campus Blood Donor Centre",
                     "The University of Hong Kong Campus Blood Donor Centre"]
    
    var bcnum:Array<String> = Array()
    

    
    override func viewDidLoad() {
        bcpicker.delegate = self
        bcpicker.dataSource = self
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.child("peopleflow").observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                print("key = \(key)  value = \(value!)")
            }
        })
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
       
        
      peopleflow.text = bcname[row]
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
