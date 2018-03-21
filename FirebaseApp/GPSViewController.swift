//
//  GPSViewController.swift
//  FirebaseApp
//
//  Created by james on 15/3/18.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class GPSViewController: UIViewController, CLLocationManagerDelegate {
    
    
   
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For use GPS when the app is open
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocation locations:[CLLocation]){
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
    
    
}
