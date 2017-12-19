//
//  Project7_TableviewController.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/11.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project7_TableviewController: UITableViewController {

    // MARK: - Properties
    var petitions = [[String:String]]()
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Show data"
        
        //let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? String(contentsOf: url) {
                let json = JSON(parseJSON: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    parse(json: json)
                    return
                }
            }
        }
        showError()
        //let button =  UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(go))
        
        //navigationItem.rightBarButtonItem = button
    }
    
    // MARK: - IBAction
    
    // MARK: - Public
//    @objc func go(){
//        //self.navigationController?.popViewController(animated: true)
//        self.navigationController?.popToRootViewController(animated: true)
//    }
    
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            petitions.append(obj)
        }
        
        tableView.reloadData()
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    // MARK: - TableviewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        
        return cell
    }
    
    // MARK: - TableviewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Project7_Detail()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Private
}
