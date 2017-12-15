//
//  Project1_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/4.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project1_HomePage: UIViewController {

    // MARK: - Properties
    var pictures = [String]()
    
    // MARK: - IBOutlet
    @IBOutlet weak var Project1_HomePage_TableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Project1_StomViewer"
        
        // 實體化專案的檔案總管
        let fm = FileManager.default
        // 實體化專案資源路徑目錄
        let path = Bundle.main.resourcePath!
        // 利用路徑，找出檔案
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        print("")
        print("path : "+path)
        
        for item in items{
            
            print("items : "+item)
            
            // 並根據所有檔案，找出開頭"nssl"的資料
            if item.hasPrefix("nssl"){
                print("item"+item)
                pictures.append(item)
            }
        }
        
        Project1_HomePage_TableView.dataSource = self
        Project1_HomePage_TableView.delegate = self
        
    }

    // MARK: - IBAction
    
    // MARK: - Public
    
    // MARK: - Private
}
extension Project1_HomePage: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Project1_HomePage_TableView_PictureCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
}
extension Project1_HomePage: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "view_Project1_Detail") as? Project1_Detail{
            vc.selectedImage = pictures[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
