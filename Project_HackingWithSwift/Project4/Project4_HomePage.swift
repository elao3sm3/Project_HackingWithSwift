//
//  Project4_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/4.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit
import WebKit

class Project4_HomePage: UIViewController {

    // MARK: - Properties
    var webView: WKWebView!
    
    // MARK: - IBOutlet
    
    
    // MARK: - LifeCycle
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Project4_EasyBrowser"
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    // MARK: - IBAction
    
    // MARK: - Public
    
    // MARK: - Private

}
extension Project4_HomePage: WKNavigationDelegate{
    
}
