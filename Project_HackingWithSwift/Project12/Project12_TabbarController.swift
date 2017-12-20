//
//  Project12_TabbarController.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/20.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project12_TabbarController: UITabBarController {
    // MARK: - Properties
    var people = [Project12_PersonClass]()
    let project12_CollectionViewcontroller = Project12_CollectionViewcontroller()
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UserDefaults"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        let storyboard = UIStoryboard(name: "Project12", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "view_Project12_CollectionViewcontroller")
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        self.viewControllers?.append(vc)
    }
    // MARK: - IBAction
    
    // MARK: - Public
    @objc func back(){
        navigationController?.popViewController(animated: true)
    }
    @objc func addNewPerson(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = project12_CollectionViewcontroller
        
        present(picker, animated: true)
    }
    
}

