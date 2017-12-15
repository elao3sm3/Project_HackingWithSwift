//
//  Project9_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/14.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project9_HomePage: UIViewController {

    // MARK: - Properties
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - IBAction
    @IBAction func GO(_ sender: UIButton) {
        let push = storyboard?.instantiateViewController(withIdentifier: "view_Project9_Tableview") as? Project9_Tableview
        
        navigationItem.leftBarButtonItem?.title = "back"
        
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    // MARK: - Public
    
    // MARK: - Private
}
