//
//  QC8ViewController.swift
//  FirebaseApp
//
//  Created by Anson on 25/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit

class QC8ViewController: UIViewController {
    @IBOutlet weak var QC8Q1: UISegmentedControl!
    @IBOutlet weak var QC8Q2: UISegmentedControl!
    @IBOutlet weak var QC8Q3: UISegmentedControl!
    @IBOutlet weak var QC8Q4: UISegmentedControl!
    @IBOutlet weak var QC8Q5: UISegmentedControl!
    
    override func viewDidLoad() {
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextPage(_ sender: UIButton) {
        if (QC8Q1.selectedSegmentIndex == 1)&&(QC8Q2.selectedSegmentIndex == 1)&&(QC8Q3.selectedSegmentIndex == 1)&&(QC8Q4.selectedSegmentIndex == 1)&&(QC8Q5.selectedSegmentIndex == 1){
            performSegue(withIdentifier: "toQC9", sender: self)
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
