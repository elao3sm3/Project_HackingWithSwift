//
//  Project2_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/4.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit
import GameplayKit

class Project2_HomePage: UIViewController {
    // MARK: - Properties
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    // MARK: - IBOutlet
    @IBOutlet weak var Project2_Button1: UIButton!
    @IBOutlet weak var Project2_Button2: UIButton!
    @IBOutlet weak var Project2_Button3: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Project2_GuessTheFlag"
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        //countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        Project2_Button1.layer.borderWidth = 1
        Project2_Button2.layer.borderWidth = 1
        Project2_Button3.layer.borderWidth = 1
        
        Project2_Button1.layer.borderColor = UIColor.lightGray.cgColor
        Project2_Button2.layer.borderColor = UIColor.lightGray.cgColor
        Project2_Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    // MARK: - IBAction
    @IBAction func buttonBeTaped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    // MARK: - Public
    func askQuestion(action: UIAlertAction! ){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        Project2_Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Project2_Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Project2_Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        title = countries[correctAnswer].uppercased()
    }
    
    // MARK: - Private
}

















