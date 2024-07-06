//
//  FriendsTableViewController.swift
//  Lab06
//
//  Created by user228347 on 7/3/24.
//

import UIKit

class FriendTableViewController: UITableViewController {

    var friends:[Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSample()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    func addSample(){

            self.friends = [
                Friend(name: "Benjamin",
                       phone: "(234) 654-1231" ,
                       email: "ben@bruner.info",
                       imgCity: UIImage(named: "Waterloo")!,
                       imgSport: UIImage(named: "esport")!,
                       imgFood: UIImage(named: "pizza")!),
                Friend(name: "Fernanda",
                       phone: "(234) 654-1232" ,
                       email: "fe@bruner.info",
                       imgCity: UIImage(named: "Waterloo")!,
                       imgSport: UIImage(named: "bike")!,
                       imgFood: UIImage(named: "fruits")!),
                Friend(name: "Geovani",
                       phone: "(234) 654-1233" ,
                       email: "geo@gmail.com",
                       imgCity: UIImage(named: "Exeter")!,
                       imgSport: UIImage(named: "soccer")!,
                       imgFood: UIImage(named: "churrasco")!),
                Friend(name: "Thiara",
                       phone: "(234) 654-1234" ,
                       email: "thi@gmail.com",
                       imgCity: UIImage(named: "Exeter")!,
                       imgSport: UIImage(named: "walking")!,
                       imgFood: UIImage(named: "feijoada")!),
                Friend(name: "Ilmar",
                       phone: "(234) 654-1235" ,
                       email: "ilmar@gmail.com",
                       imgCity: UIImage(named: "Joinville")!,
                       imgSport: UIImage(named: "target shooting")!,
                       imgFood: UIImage(named: "churrasco")!),
                Friend(name: "Kirk",
                       phone: "(234) 654-1236" ,
                       email: "kirk@gmail.com",
                       imgCity: UIImage(named: "Mexico")!,
                       imgSport: UIImage(named: "esport")!,
                       imgFood: UIImage(named: "fries")!),
                Friend(name: "Dilheri",
                       phone: "(234) 654-1237" ,
                       email: "di@gmail.com",
                       imgCity: UIImage(named: "Mexico")!,
                       imgSport: UIImage(named: "walking")!,
                       imgFood: UIImage(named: "mexican-food")!),
                Friend(name: "Joao",
                       phone: "(234) 654-1238" ,
                       email: "joao@gmail.com",
                       imgCity: UIImage(named: "Balneario Camboriu")!,
                       imgSport: UIImage(named: "bike")!,
                       imgFood: UIImage(named: "fries")!),
                Friend(name: "Caio",
                       phone: "(234) 654-1239" ,
                       email: "caio@gmail.com",
                       imgCity: UIImage(named: "Itajai")!,
                       imgSport: UIImage(named: "target shooting")!,
                       imgFood: UIImage(named: "feijoada")!),
            ]
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(self.friends.count)
        return self.friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        
        cell.set(friend: friends[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
