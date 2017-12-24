//
//  Project22_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/24.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit
import CoreLocation

class Project22_HomePage: UIViewController {
    // MARK: - Properties
    var locationManager: CLLocationManager!
    
    // MARK: - IBOutlet
    @IBOutlet weak var Project22_DistanceReading: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project22_DetectABeacon"
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        view.backgroundColor = UIColor.gray
    }
   
    // MARK: - IBAction
    
    // MARK: - Public
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 0.8) { [unowned self] in
            switch distance {
            case .unknown:
                self.view.backgroundColor = UIColor.gray
                self.Project22_DistanceReading.text = "UNKNOWN"
                
            case .far:
                self.view.backgroundColor = UIColor.blue
                self.Project22_DistanceReading.text = "FAR"
                
            case .near:
                self.view.backgroundColor = UIColor.orange
                self.Project22_DistanceReading.text = "NEAR"
                
            case .immediate:
                self.view.backgroundColor = UIColor.red
                self.Project22_DistanceReading.text = "RIGHT HERE"
            }
        }
    }
    // MARK: - Private
    
}
extension Project22_HomePage: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            let beacon = beacons[0]
            update(distance: beacon.proximity)
        } else {
            update(distance: .unknown)
        }
    }
}
