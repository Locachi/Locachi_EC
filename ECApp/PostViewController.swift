//
//  PostViewController.swift
//  ECApp
//
//  Created by 神崎泰旗 on 2018/11/13.
//  Copyright © 2018年 taiki. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class PostViewController: UIViewController {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var displayName = String()
    var pictureURLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayName = UserDefaults.standard.object(forKey: "displayName")
            as! String
        
        print(displayName)
        
        pictureURLString = UserDefaults.standard.object(forKey: "pictureURLString")
            as! String
        
        nameLabel.text = displayName
        profileImageView.sd_setImage(with: URL(string: pictureURLString), completed: nil)
        profileImageView.layer.cornerRadius = 8.0
        profileImageView.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func post(_ sender: Any) {
        
        let rootRef = Database.database().reference(fromURL: "https://locachiec.firebaseio.com/").child("post").childByAutoId()
        
        let feed = ["comment":textField.text,"userName":nameLabel.text] as [String:Any]
        rootRef.setValue(feed)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
