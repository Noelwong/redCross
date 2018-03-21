//
//  ViewController.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-02.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

final class DonorCentre: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For use GPS when the app is open
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let HeadquartersCoordinate = CLLocationCoordinate2D(latitude: 22.310608,longitude: 114.174538)
        let HeadquartersAnnotation = DonorCentre(coordinate: HeadquartersCoordinate, title:"HeadquartersDonorCentre",
                                        subtitle: "Addres: 15 King's Park Rise, near Wylie Road. Telephone : 2710 1202")
        
        let WestKowloonCoordinate = CLLocationCoordinate2D(latitude: 22.314642,longitude: 114.162527)
        let WestKowloonAnnotation = DonorCentre(coordinate: WestKowloonCoordinate, title:"WestKowloonDonorCentre",
                                                 subtitle: "Addres: 6/F, Hong Kong Red Cross Headquarters,19 Hoi Ting Road, West Kowloon. Telephone : 2507 7733")
        
        let MongkokCoordinate = CLLocationCoordinate2D(latitude: 22.315615,longitude: 114.170457)
        let MongkokAnnotation = DonorCentre(coordinate: MongkokCoordinate, title:"MongkokDonorCentre",
                                                subtitle: "Addres: 15/F Chow Tai Fook Centre, 580A Nathan Road,  Mongkok, Kowloon. Telephone : 2770 5930")
        
        let KwunTongCoordinate = CLLocationCoordinate2D(latitude: 22.312407,longitude: 114.225221)
        let KwunTongAnnotation = DonorCentre(coordinate: KwunTongCoordinate, title:"KwunTongDonorCentre",
                                            subtitle: "Addres: Units 2301 & 2316, 23/F., Millennium City 5, 418 Kwun Tong Road, Kwun Tong, Kowloon. Telephone : 3148 1375")
        
        let CentralDistrictCoordinate = CLLocationCoordinate2D(latitude: 22.283163,longitude: 114.156778)
        let CentralDistrictAnnotation = DonorCentre(coordinate: CentralDistrictCoordinate, title:"CentralDistrictDonorCentre",
                                             subtitle: "Addres: 1/F., Tung Ming Building, 40-42 Des Voeux Road C., Central (Central MTR station Exit C). Telephone : 2526 1420")
        
        let CausewayBayCoordinate = CLLocationCoordinate2D(latitude: 22.279259,longitude: 114.181582)
        let CausewayBayAnnotation = DonorCentre(coordinate: CausewayBayCoordinate, title:"CausewayBayDonorCentre",
                                                subtitle: "Addres: 14/F, Plaza 2000, 2-4 Russell Street, Causeway Bay (Causeway Bay MTR Station Exit A). Telephone : 2834 2084")
        
        let ShatinCoordinate = CLLocationCoordinate2D(latitude: 22.379986,longitude: 114.186506)
        let ShatinAnnotation = DonorCentre(coordinate: ShatinCoordinate, title:"ShatinDonorCentre",
                                                subtitle: "Addres: 1/F., 1A, Shatin Centre Street, Shatin, NT. Telephone : 2603 0100")
        
        let TsuenWanCoordinate = CLLocationCoordinate2D(latitude: 22.373000,longitude: 114.116702)
        let TsuenWanAnnotation = DonorCentre(coordinate: TsuenWanCoordinate, title:"TsuenWanDonorCentre",
                                                subtitle: "Addres: 8 Tai Ho Road, Tsuen Wan, near Tsuen Wan MTR station Exit A.  Telephone : 2414 2378")
        
        let YuenLongCoordinate = CLLocationCoordinate2D(latitude: 22.444736,longitude: 114.028092)
        let YuenLongAnnotation = DonorCentre(coordinate: YuenLongCoordinate, title:"YuenLongDonorCentre",
                                            subtitle: "Addres: Unit Nos. 704-705, 7/F, Yuen Long Landmark, 115-127 Yuen Long Castle Peak Road, Yuen Long.")
        
        let HKPolytechnicUCoordinate = CLLocationCoordinate2D(latitude: 22.304986,longitude: 114.179923)
        let HKPolytechnicUAnnotation = DonorCentre(coordinate: HKPolytechnicUCoordinate, title:"TheHKPolytechnicUniversityCampusBloodDonorCentre",
                                                subtitle: "Venue: Integrative Health Clinic, Room AG057, Core A, PolyU Campus (located next to Fountain Square). Telephone : 2766 5517/6392 5779")
        
        let HKUCoordinate = CLLocationCoordinate2D(latitude: 22.283108,longitude: 114.137072)
        let HKUAnnotation = DonorCentre(coordinate: HKUCoordinate, title:"TheUniversityOfHKCampusBloodDonorCentre",
                                                   subtitle: "Venue: MB254, 2/F, Main Building, The University of Hong Kong. Telephone : 6392 5778")
        
        mapView.addAnnotation(HeadquartersAnnotation)
        mapView.addAnnotation(WestKowloonAnnotation)
        mapView.addAnnotation(MongkokAnnotation)
        mapView.addAnnotation(KwunTongAnnotation)
        mapView.addAnnotation(CentralDistrictAnnotation)
        mapView.addAnnotation(CausewayBayAnnotation)
        mapView.addAnnotation(ShatinAnnotation)
        mapView.addAnnotation(TsuenWanAnnotation)
        mapView.addAnnotation(YuenLongAnnotation)
        mapView.addAnnotation(HKPolytechnicUAnnotation)
        mapView.addAnnotation(HKUAnnotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
    }
}

extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        if let DonorCentreView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView{
            DonorCentreView.animatesWhenAdded = true
            DonorCentreView.titleVisibility = .adaptive
            DonorCentreView.titleVisibility = .adaptive
            
            return DonorCentreView
        }
        return nil
    }
}
