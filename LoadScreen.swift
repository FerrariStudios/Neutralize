//
//  ViewController.swift
//  userLocation
//
//  Created by Sebastian Hette on 19.09.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var secHold: RoundButton!
    @IBOutlet weak var legislator: RoundButton!
    @IBOutlet weak var learnMore: RoundButton!
    //Map
    @IBOutlet weak var reportActive: RoundButton!
    @IBOutlet weak var giveTip: RoundButton!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var LoadLogo: UIImageView!
    
    @IBOutlet weak var hold: UILabel!
    var counter = 0.0
    var timer = Timer()
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]

        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        
        map.mapType = MKMapType.hybrid
        self.map.showsUserLocation = true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        LoadLogo.alpha = 1
        giveTip.alpha = 0
        reportActive.alpha = 0
        header.alpha = 0
        learnMore.alpha = 0
        legislator.alpha = 0
        map.alpha = 0
        hold.alpha = 0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnce(_:)))
        let holdGestrue = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        reportActive.addGestureRecognizer(tapGesture)
        reportActive.addGestureRecognizer(holdGestrue)
        
        updateCountNumber()
        
        
        
        UIView.animate(withDuration: 0.8, animations: {
            self.LoadLogo.alpha = 0
            
        }) { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                
            }, completion: { (true) in
                
                UIView.animate(withDuration: 0.6, animations: {
                    self.giveTip.alpha = 1
                    self.reportActive.alpha = 1
                    self.header.alpha = 1
                    self.learnMore.alpha = 1
                    self.legislator.alpha = 1
                    self.map.alpha = 1
                    self.hold.alpha = 1

                })
            })
        }
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tapOnce(_ sender: UIGestureRecognizer) {
        counter = 0
        updateCountNumber()
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer) {
        if sender.state == .ended  {
            timer.invalidate()
            counter = 0
            updateCountNumber()
        } else if sender.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countNumberPlusOne), userInfo: nil, repeats: true)
        }
    }
    
    @objc func countNumberPlusOne() {
        
        counter += 0.1
        updateCountNumber()
        
    }
    
    
    
    func updateCountNumber() {
        if (counter < 2.6)
        {
            self.secHold.frame.size = CGSize(width: counter*100, height: 50)
        }
        
       if (counter >= 2.6)
       {
    counter = 0
     timer.invalidate()
        let alert = UIAlertController(title: "Alert Authorities?", message: "Are you sure that you want to alert the authorities?", preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            self.performSegue(withIdentifier: "ReportActive", sender: self)

        }))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
           self.counter = 0
            
            self.countNumberPlusOne()
            self.secHold.frame.size = CGSize(width: 0, height: 50)

        }))
        self.present(alert, animated: true, completion: nil)
        

        
        }
        
    }
    @IBAction func HomeSurvey(segue: UIStoryboardSegue){
        
    }
}


