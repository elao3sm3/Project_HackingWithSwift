//
//  Project18_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/24.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project18_HomePage: UIViewController {
    // MARK: - Properties
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project18_Debugging"
        
//        print("I'm inside the viewDidLoad() method!")
//        print(1, 2, 3, 4, 5)
//        print(1, 2, 3, 4, 5, separator: "-")
//        print("Some message", terminator: "")
//
//        assert(1 == 1, "Maths failure!")
        //assert(1 == 2, "Maths failure!")
        
        for i in 1 ... 100 {
            print("Got number \(i)") // lldb : p i or po i
        }
    }
    // MARK: - IBAction
    
    // MARK: - Public
    
    // MARK: - Private
   

}
