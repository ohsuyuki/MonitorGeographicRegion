//
//  ViewController.swift
//  MonitorGeographicRegion
//
//  Created by osu on 2018/04/22.
//  Copyright © 2018 osu. All rights reserved.
//

import UIKit
import CoreLocation
import CocoaLumberjack

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var isMonitoring: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        
        let status = CLLocationManager.authorizationStatus()
        if (status != CLAuthorizationStatus.authorizedAlways) {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch (status) {
        case .authorizedAlways:
            monitoring()
            break
        default:
            break
        }
    }
    
    func monitoring() {
        guard isMonitoring == false else {
            return
        }

        locationManager.startUpdatingLocation()

        let locations: [CLCircularRegion] = [
            CLCircularRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(35.686767), longitude: CLLocationDegrees(139.763854)), radius: 20, identifier: "OtemachiBuildingNW"),
            CLCircularRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(35.686441), longitude: CLLocationDegrees(139.766005)), radius: 20, identifier: "OtemachiBuildingNE"),
            CLCircularRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(35.686057), longitude: CLLocationDegrees(139.765952)), radius: 20, identifier: "OtemachiBuildingSE"),
            CLCircularRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(35.686275), longitude: CLLocationDegrees(139.763704)), radius: 20, identifier: "OtemachiBuildingSW"),
            CLCircularRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(35.686384), longitude: CLLocationDegrees(139.764831)), radius: 20, identifier: "OtemachiBuildingCenter"),
        ]
        for location in locations {
            locationManager.startMonitoring(for: location)
        }
        
        isMonitoring = true
    }

    public func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        DDLogVerbose("Enter: \(region.description)")
    }

    public func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        DDLogVerbose("Exit: \(region.description)")
    }
}
