//
//  QC14ViewController.swift
//  FirebaseApp
//
//  Created by Anson on 25/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit
import Firebase

class QC14ViewController: UIViewController {
    @IBOutlet weak var QC14Q1: UISegmentedControl!
    
    @IBOutlet weak var QC14Q2: UISegmentedControl!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Last(_ sender: UIButton) {
        ref = Database.database().reference()
          let uid = Auth.auth().currentUser!.uid
        
        if (QC14Q1.selectedSegmentIndex == 1)&&(QC14Q2.selectedSegmentIndex == 1){
            performSegue(withIdentifier: "backtohome", sender: self)
            
            ref.child("user").child(uid).child("finishQC").setValue(1)

        }else{
            // create the alert
            let alert = UIAlertController(title: "Sorry", message: "You do not meet the requirements of our blood donation", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: { _ -> Void in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage") as! HomeViewController
                self.present(nextViewController, animated: true, completion: nil)
            })
            // show the alert
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
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
