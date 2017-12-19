//
//  Project7_TabbarController.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/13.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project7_TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Project7", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Project7_NavController")
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        self.viewControllers?.append(vc)
    }

}
