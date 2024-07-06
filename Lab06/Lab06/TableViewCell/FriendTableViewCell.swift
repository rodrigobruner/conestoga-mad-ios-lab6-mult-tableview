//
//  FriendTableViewCell.swift
//  Lab06
//
//  Created by user228347 on 7/3/24.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!

    @IBOutlet weak var labelPhone: UILabel!
    
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var imageCity: UIImageView!
    
    @IBOutlet weak var imageSport: UIImageView!
    
    @IBOutlet weak var imageFood: UIImageView!
    
    func set(friend:Friend){
        labelName.text = friend.name
        labelPhone.text = friend.phone
        labelEmail.text = friend.email
        imageCity.image = friend.imgCity
        imageSport.image = friend.imgSport
        imageFood.image = friend.imgFood
    }
}
