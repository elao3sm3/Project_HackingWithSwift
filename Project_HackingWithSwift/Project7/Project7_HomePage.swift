//
//  Project7_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/11.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project7_HomePage: UIViewController {
    // MARK: - Properties
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project7_WhitehousePetitions"
    }

    // MARK: - IBAction
    
    // MARK: - Public
    @IBAction func go(_ sender: UIButton) {
        let push = storyboard?.instantiateViewController(withIdentifier: "view_Project7_TabbarController") as? Project7_TabbarController
        
        navigationItem.leftBarButtonItem?.title = "back"
        
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    // MARK: - Private
}
