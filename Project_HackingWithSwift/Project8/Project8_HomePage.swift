//
//  Project8_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/14.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit
import GameplayKit

class Project8_HomePage: UIViewController {

    // MARK: - Properties
    //存放20個答案按鈕
    var letterButtons = [UIButton]()
    //存放被按的按鈕
    var activateButtons = [UIButton]()
    //存放正確答案
    var solutions = [String]()
    //存放分數，並設定屬性觀察器，用於分數改變時，同步改變分數顯示
    var score = 0 {
        didSet {
            Project8_score.text = "Score: \(score)"
        }
    }
    //目前遊玩的等級
    var level = 1
    
    // MARK: - IBOutlet
    @IBOutlet weak var Project8_score: UILabel!
    @IBOutlet weak var Project8_clues: UILabel!
    @IBOutlet weak var Project8_answer: UILabel!
    @IBOutlet weak var Project8_textField: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project8_7SwiftyWords"
        
        for subview in view.subviews where subview.tag == 1001 {
            let btn = subview as! UIButton
            letterButtons.append(btn)
            
            btn.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
        }
        
        loadLevel()
    }
    
    // MARK: - IBAction
    @IBAction func submit(_ sender: UIButton) {
        if let solutionPosition = solutions.index(of: Project8_answer.text!) {
            activateButtons.removeAll()
            
            var splitAnswers = Project8_answer.text!.components(separatedBy: "\n")
            splitAnswers[solutionPosition] = Project8_textField.text!
            Project8_answer.text = splitAnswers.joined(separator: "\n")
            
            Project8_answer.text = ""
            score += 1
            
            if score % 7 == 0 {
                let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
                present(ac, animated: true)
            }
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        Project8_answer.text = ""
        
        for btn in activateButtons {
            btn.isHidden = false
        }
        
        activateButtons.removeAll()
    }
    
    // MARK: - Public
    @objc func letterTapped(btn: UIButton){
        //顯示使用者按了哪些答案按鈕
        Project8_textField.text = Project8_textField.text! + btn.titleLabel!.text!
        //把按過的按鈕放入，這樣當使用者clear時才知道哪些要重新顯示
        activateButtons.append(btn)
        //並不顯示
        btn.isHidden = true
    }
    func loadLevel() {
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        if let levelFilePath = Bundle.main.path(forResource: "level\(level)", ofType: "txt") {
            if let levelContents = try? String(contentsOfFile: levelFilePath) {
                var lines = levelContents.components(separatedBy: "\n")
                lines = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: lines) as! [String]
                
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(index + 1). \(clue)\n"
                    
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                }
            }
        }
        
        Project8_clues.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        Project8_answer.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        letterBits = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: letterBits) as! [String]
        
        if letterBits.count == letterButtons.count {
            for i in 0 ..< letterBits.count {
                
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    // MARK: - Private
    func levelUp(action: UIAlertAction) {
        level += 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        
        for btn in letterButtons {
            btn.isHidden = false
        }
    }

}
