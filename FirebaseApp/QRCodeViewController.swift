//
//  QRCodeViewController.swift
//  FirebaseApp
//
//  Created by Anson on 24/3/2018.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit
import Firebase

class QRCodeViewController: UIViewController {
    
    @IBOutlet weak var displayCodeView: UIImageView!
    var filter:CIFilter!

    @IBOutlet weak var showUID: UILabel!
    
    @IBOutlet weak var UIDtitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let uidtitle = "UID"
    let uid = Auth.auth().currentUser!.uid
    
    @IBAction func generatePressed(_ sender: UIButton) {
        UIDtitle.text = uidtitle
        showUID.text = uid
        
        if let text = showUID.text{
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            filter = CIFilter(name: "CIQRCodeGenerator")
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y:10)
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            displayCodeView.image = image
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
