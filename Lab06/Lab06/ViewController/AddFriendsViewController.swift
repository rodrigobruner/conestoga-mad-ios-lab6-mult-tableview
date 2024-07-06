//
//  AddFriendsViewController.swift
//  Lab06
//
//  Created by user228347 on 7/6/24.
//

import UIKit

class AddFriendsViewController: UIViewController {

    
    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var textPhone: UITextField!
    
    @IBOutlet weak var textEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addFriend(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "friends") as! FriendTableViewController
        print(vc.friends)
        
        vc.friends.append(
            Friend(name: textName.text ?? "No name",
                   phone: textPhone.text ?? "No phone",
                   email: textEmail.text ?? "No e-mail"))
        vc.tableView.reloadData()

        navigationController?.popViewController(animated: true)
    }
}
