//
//  Project25_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/25.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project25_HomePage: UIViewController {

    // MARK: - Properties
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project25_SelfieShare"
    }
    
    // MARK: - IBAction
    @IBAction func GO(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "view_Project25_collectionView") as! Project25_collectionView
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Public
    
    // MARK: - Private
}
