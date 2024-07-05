//
//  CarTableViewController.swift
//  Lab06
//
//  Created by user228347 on 7/3/24.
//

import UIKit

class CarTableViewController: UITableViewController {
    

    @IBOutlet var carTableView: UITableView!
    
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSample()
        carTableView.dataSource = self
        carTableView.delegate = self
    }
    
    func addSample(){
        self.cars = [
            Car(make: "Tesla", model: "Type A"),
            Car(make: "Tesla", model: "Type b"),
            Car(make: "Tesla", model: "Type c"),
            Car(make: "Tesla", model: "Type d"),
            Car(make: "Tesla", model: "Type e"),
        ]
    }
    
    @IBAction func addCar(_ sender: Any) {
        let alert = UIAlertController(title: "Add a new car", message: "Please fill in the fields below", preferredStyle: .alert)
               
               alert.addTextField { field in
                   field.placeholder = "Car make"
                   field.returnKeyType = .next
               }
        
                alert.addTextField { field in
                    field.placeholder = "Car model"
                    field.returnKeyType = .next
                }
               
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
               alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {_ in
                   guard let fields = alert.textFields, fields.count ==  2 else {
                       return
                   }
                   
                   let carMakeField = fields[0]
                   guard let carMake = carMakeField.text, !carMake.isEmpty else {
                       return
                   }
                   
                   let carModelField = fields[1]
                   guard let carModel = carModelField.text, !carModel.isEmpty else {
                       return
                   }


                   self.cars.append(Car(make: carMake, model: carModel))
                   
                   self.carTableView.reloadData()
                   
                  
               }))
               
               present(alert, animated: true)
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            self.cars.remove(at: indexPath.row)
            self.carTableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = carTableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell

        var car = self.cars[indexPath.row]
        car.image = car.image ?? UIImage(named: "car-default")
        
        cell.set(image: car.image!, make: car.make, model: car.model)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
