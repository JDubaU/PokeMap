//
//  ViewController.swift
//  PokeMap
//
//  Created by Jake Wojtas on 6/18/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import UIKit
import MapKit
import Darwin

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var compassButton: UIButton!
    
    var updateCount = 0
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("Location permission granted")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
                //Spawn pokemon
                print("Timer")
                
                if let coord = self.manager.location?.coordinate {
                    let anno = MKPointAnnotation()
                    let randLat = (Double(arc4random_uniform(200)) - 100) / 100000.0
                    
                    let randLon = (Double(arc4random_uniform(200)) - 100) / 100000.0
                    anno.coordinate = coord
                    anno.coordinate.latitude += randLat
                    anno.coordinate.longitude += randLon
                    self.mapView.addAnnotation(anno)
                }
                
            })
            
            
        } else {
        manager.requestWhenInUseAuthorization()
        }
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Updating location")
        if updateCount < 3 {
            let region = MKCoordinateRegionMakeWithDistance((manager.location?.coordinate)!, 1200, 1200)
            mapView.setRegion(region, animated: false)
            updateCount += 1
        } else {
            manager.stopUpdatingLocation()
        }
    }
    
    @IBAction func compassButton(_ sender: Any) {
        if let coord = manager.location?.coordinate {
            let region = MKCoordinateRegionMakeWithDistance(coord, 200, 200)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

