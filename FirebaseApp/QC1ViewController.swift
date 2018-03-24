//
//  QC1ViewController.swift
//  FirebaseApp
//
//  Created by Anson on 24/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit

class QC1ViewController: UIViewController {
    @IBOutlet weak var QC1Q1: UISegmentedControl!
    @IBOutlet weak var QC1Q2: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextPage(_ sender: UIButton) {
        if (QC1Q1.selectedSegmentIndex == 1)&&(QC1Q2.selectedSegmentIndex == 1){
        performSegue(withIdentifier: "QC1toNextPage", sender: self)
        }else{
            // create the alert
            let alert = UIAlertController(title: "Sorry", message: "You do not meet the requirements of our blood donation", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            performSegue(withIdentifier: "BacktoHome", sender: self)
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
