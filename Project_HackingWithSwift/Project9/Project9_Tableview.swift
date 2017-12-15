//
//  Project9_Tableview.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/14.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class Project9_Tableview: UITableViewController {

    // MARK: - Properties
    var petitions = [[String:String]]()
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Show data"
        
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            if let url = URL(string: urlString) {
                if let data = try? String(contentsOf: url) {
                    let json = JSON(parseJSON: data)
                    
                    if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                        self.parse(json: json)
                        return
                    }
                }
            }
        }

    }

   
    // MARK: - IBAction
    
    // MARK: - Public
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
    // MARK: - Private
    
    // MARK: - Table view data source

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
   

}
