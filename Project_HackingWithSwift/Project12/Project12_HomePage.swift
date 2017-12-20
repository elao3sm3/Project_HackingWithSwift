//
//  Project12_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/20.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project12_HomePage: UIViewController {
    // MARK: - Properties view_Project12_NavController
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project12_UserDefaults"
    }
    // MARK: - IBAction
    @IBAction func GO(_ sender: UIButton) {
        let push = storyboard?.instantiateViewController(withIdentifier: "view_project12_TabbarController") as! Project12_TabbarController
        
        navigationController?.isToolbarHidden = true
        
        navigationController?.pushViewController(push, animated: true)
        
    }
    
    
    // MARK: - Public
    
    // MARK: - Private
}
