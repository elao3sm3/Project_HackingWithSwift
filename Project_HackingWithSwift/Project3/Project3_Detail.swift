//
//  Project3_Detail.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/18.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project3_Detail: UIViewController {

    // MARK: - Properties
    var selectedImage: String?
    
    // MARK: - IBOutlet
    @IBOutlet weak var Project3_Detail_ImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Detail"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage{
            Project3_Detail_ImageView.image = UIImage(named: imageToLoad)
        }
    }
    // MARK: - IBAction
    
    // MARK: - Public
    @objc func shareTapped(){
        let vc = UIActivityViewController(activityItems: [Project3_Detail_ImageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    // MARK: - Private

}
