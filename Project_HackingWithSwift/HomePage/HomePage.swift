//
//  HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/11/25.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

class HomePage: UIViewController {

    // MARK: - Properties
    var projectArray: [String]?
    var projectViewController = [Project1_HomePage.self,Project2_HomePage.self]
    
    // MARK: - IBOutlet
    @IBOutlet weak var HP_tableview: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "目錄"
        
        projectArray = ["Project1_StomViewer","Project2_GuessTheFlag","Project3_SocialMedia","Project4_EasyBrowser","Project5_WordScramble","Project6_AutoLayout","Project7_WhitehousePetitions","Project8_7SwiftyWords","Project9_GCD","Project10_NamesToFaces","Project11_Pachinko","Project12_UserDefaults","Project13_Instafilter"]
        
        HP_tableview.dataSource = self
        HP_tableview.delegate = self

    }
    
   // MARK: - IBAction
    
   // MARK: - Public
    
   // MARK: - Private

}
extension HomePage: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (projectArray?.count)!
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "HP_projectCell", for: indexPath) //as! HP_projectCell
        
        //cell.HP_pC_Label.text = projectArray![indexPath.row]
        let label = cell.viewWithTag(1) as! UILabel
        label.text = projectArray![indexPath.row]
        
        return cell
    }

}

extension HomePage: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project1_HomePage") as? Project1_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 1:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project2_HomePage") as? Project2_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 2:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project3_HomePage") as? Project3_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 3:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project4_HomePage") as? Project4_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 4:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project5_HomePage") as? Project5_HomePage
            self.navigationController?.pushViewController(push!, animated: true)
        case 5:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project6_HomePage") as? Project6_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 6:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project7_HomePage") as? Project7_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 7:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project8_HomePage") as? Project8_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 8:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project9_HomePage") as? Project9_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 9:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project10_HomePage") as? Project10_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 10:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project11_HomePage") as? Project11_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        case 11:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project12_HomePage") as? Project12_HomePage
            navigationController?.setToolbarHidden(true, animated: true)
            self.navigationController?.pushViewController(push!, animated: true)
        case 12:
            let push = storyboard?.instantiateViewController(withIdentifier: "view_Project13_HomePage") as? Project13_HomePage
            
            self.navigationController?.pushViewController(push!, animated: true)
        default:
            print("Over the range.")
        }
    }
}
