//
//  Test2ViewController.swift
//  FirebaseApp
//
//  Created by Anson on 25/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {
    @IBOutlet weak var T2Q1: UISegmentedControl!
    @IBOutlet weak var T2Q2: UISegmentedControl!
    @IBOutlet weak var T2Q3: UISegmentedControl!
    @IBOutlet weak var T2Q4: UISegmentedControl!
    
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
        if (T2Q1.selectedSegmentIndex == 1)&&(T2Q2.selectedSegmentIndex == 1)&&(T2Q3.selectedSegmentIndex == 1)&&(T2Q4.selectedSegmentIndex == 1){
            performSegue(withIdentifier: "toTest3", sender: self)
        }else{
            // create the alert
            let alert = UIAlertController(title: "Sorry", message: "You may not be eligible to donate", preferredStyle: UIAlertControllerStyle.alert)
            
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
