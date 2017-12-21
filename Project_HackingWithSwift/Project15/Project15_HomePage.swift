//
//  Project15_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/21.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project15_HomePage: UIViewController {

    // MARK: - Properties
   
    var imageView: UIImageView!
    var currentAnimation = 0
    
    // MARK: - IBOutlet
     @IBOutlet weak var Project15_TapButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project15_Animation"
        
        
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: view.center.x, y: view.center.y)
        view.addSubview(imageView)
    }
    // MARK: - IBAction
    
    @IBAction func Tapped(_ sender: UIButton) {
        Project15_TapButton.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],animations: { [unowned self] in
                        switch self.currentAnimation {
                        case 0:
                            self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                        case 1:
                            self.imageView.transform = CGAffineTransform.identity
                        case 2:
                            self.imageView.transform = CGAffineTransform(translationX: 0, y: 74)
                        case 3:
                            self.imageView.transform = CGAffineTransform.identity
                        case 4:
                            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                        case 5:
                            self.imageView.transform = CGAffineTransform.identity
                        case 6:
                            self.imageView.alpha = 0.1
                            self.imageView.backgroundColor = UIColor.green
                            
                        case 7:
                            self.imageView.alpha = 1
                            self.imageView.backgroundColor = UIColor.clear
                        default:
                            break
                        }
        }) { [unowned self] (finished: Bool) in
            self.Project15_TapButton.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
    // MARK: - Public
    
    // MARK: - Private
}
