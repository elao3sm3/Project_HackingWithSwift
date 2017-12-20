//
//  Project12_CollectionViewcontroller.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/20.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class Project12_CollectionViewcontroller: UICollectionViewController {
    // MARK: - Properties
    var people = [Project12_PersonClass]()
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    // MARK: - IBAction
    
    // MARK: - Public
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    // MARK: - Private
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return people.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? Project12_CollectionViewcontroller_Cell
        
        let person = people[indexPath.item]
        
        cell!.Project12_CollectionViewCell_Label.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell!.Project12_CollectionViewCell_ImageView.image = UIImage(contentsOfFile: path.path)
        
        cell!.Project12_CollectionViewCell_ImageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        cell!.Project12_CollectionViewCell_ImageView.layer.borderWidth = 2
        cell!.Project12_CollectionViewCell_ImageView.layer.cornerRadius = 3
        cell!.layer.cornerRadius = 7
        
        return cell!
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [unowned self, ac] _ in
            let newName = ac.textFields![0]
            person.name = newName.text!
            
            self.collectionView?.reloadData()
        })
        
        present(ac, animated: true)
    }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
extension Project12_CollectionViewcontroller: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = UIImageJPEGRepresentation(image, 80) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Project12_PersonClass(name: "Unknown", image: imageName)
        people.append(person)
        print("people:\(people)")
        
        collectionView!.reloadData()
        
        dismiss(animated: true)
    }
}
extension Project12_CollectionViewcontroller: UINavigationControllerDelegate{
    
}
