//
//  AlertAuthorities.swift
//  Neutralize
//
//  Created by User on 3/10/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AlertAuthorities:  UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var showApp: UIButton!
    @IBOutlet weak var getSafeLabel: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var mapInfo: UILabel!
    
    @IBOutlet weak var nextmap: UIButton!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.0035, 0.0035)

        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        
        map.mapType = MKMapType.hybrid
        self.map.showsUserLocation = true
        
        
        let longPressGestureRecogn = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
        longPressGestureRecogn.minimumPressDuration = 0.3
        map.addGestureRecognizer(longPressGestureRecogn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getSafeLabel.alpha = 1
        self.blur.alpha = 1
        self.showApp.alpha = 1
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

    }
    @objc func addAnnotation(press:UILongPressGestureRecognizer)
    {
        if press.state == .began
        {
            let location = press.location(in: map)
            let coordinates = map.convert(location, toCoordinateFrom: map)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            
            
            map.addAnnotation(annotation)
        }
    }
    @IBAction func getSafe(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.getSafeLabel.alpha = 0
            self.blur.alpha = 0
            self.showApp.alpha = 0
        }) { (true) in
            

        }
    }
    
    
   
        
    }

    


