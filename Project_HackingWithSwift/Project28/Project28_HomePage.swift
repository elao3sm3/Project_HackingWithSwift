//
//  Project28_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/26.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit
import NotificationCenter
import LocalAuthentication

class Project28_HomePage: UIViewController {
    // MARK: - Properties
    
    // MARK: - IBOutlet
    @IBOutlet weak var Project28_secret: UITextView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project28_SecretSwift"
        title = "Nothing to see here"
        
        let project28_notificationCenter = NotificationCenter.default
        project28_notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        project28_notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        project28_notificationCenter.addObserver(self, selector: #selector(saveSecretMessage), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    // MARK: - IBAction
    @IBAction func Project28_authenticateTapped(_ sender: UIButton) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] (success, authenticationError) in
                
                DispatchQueue.main.async {
                    if success {
                        self.unlockSecretMessage()
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    // MARK: - Public
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            Project28_secret.contentInset = UIEdgeInsets.zero
        } else {
            Project28_secret.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        Project28_secret.scrollIndicatorInsets = Project28_secret.contentInset
        
        let selectedRange = Project28_secret.selectedRange
        Project28_secret.scrollRangeToVisible(selectedRange)
    }
    
    @objc func saveSecretMessage() {
        if !Project28_secret.isHidden {
            _ = KeychainWrapper.standard.set(Project28_secret.text, forKey: "SecretMessage")
            Project28_secret.resignFirstResponder()
            Project28_secret.isHidden = true
            title = "Nothing to see here"
        }
    }
    
    // MARK: - Private
    func unlockSecretMessage() {
        Project28_secret.isHidden = false
        title = "Secret stuff!"
        
        if let text = KeychainWrapper.standard.string(forKey: "SecretMessage") {
            Project28_secret.text = text
        }
    }

}
