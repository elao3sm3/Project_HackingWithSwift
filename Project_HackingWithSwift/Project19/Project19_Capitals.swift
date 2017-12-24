//
//  Project19_Capitals.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/24.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import MapKit
import UIKit

class Project19_Capitals: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
