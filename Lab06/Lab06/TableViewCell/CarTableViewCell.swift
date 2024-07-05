//
//  CarTableViewCell.swift
//  Lab06
//
//  Created by user228347 on 7/3/24.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var model: UILabel!
    
    func set(image:UIImage, make:String, model:String){
        self.carImage.image = image
        self.make.text = make
        self.model.text = model
    }
}
