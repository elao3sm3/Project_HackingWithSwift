//
//  Project1_Detail.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/6.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project1_Detail: UIViewController {

    // MARK: - Properties
    var selectedImage: String?
    
    // MARK: - IBOutlet
    @IBOutlet weak var Project1_Detail_ImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Detail"
        
        if let imageToLoad = selectedImage{
            Project1_Detail_ImageView.image = UIImage(named: imageToLoad)
        }
    }
    // MARK: - IBAction
    
    // MARK: - Public
    
    // MARK: - Private
}
