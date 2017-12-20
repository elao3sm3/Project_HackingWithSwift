//
//  Project10_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/20.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project10_HomePage: UIViewController {

    // MARK: - Properties
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Project10_NamesToFaces"
    }
    
    // MARK: - IBAction
    @IBAction func GO(_ sender: UIButton) {
        let push = storyboard?.instantiateViewController(withIdentifier: "view_Project10_CollectionViewcontroller") as? Project10_CollectionViewcontroller
        
        navigationController?.pushViewController(push!, animated: true)
    }
    
    // MARK: - Public
    
    // MARK: - Private
}
