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
    
    var bcname = ["",
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
    
    
    var bcnum2 = ["","","","","","","","","","","",""]
    
    override func viewDidLoad() {
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        bcpicker.delegate = self
        bcpicker.dataSource = self
        

        
        
        ref = Database.database().reference()
        ref.child("peopleflow").observeSingleEvent(of: .value, with: { (snapshot) in
          var count = 0
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                print("key = \(key)  value = \(value!)")
                self.bcname[count] = "\(key)"
                self.bcnum2[count] = "\(value!)"
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
       peopleflow.text =    bcnum2[row]
        
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
