//
//  HouseTableViewController.swift
//  VirtualHomeTour
//
//  Created by Pooja on 11/30/15.
//  Copyright (c) 2015 Pooja. All rights reserved.
//

import UIKit

class HouseTableViewController: UITableViewController {
    
    var housesFromList = [House]()
    
    var houseNameToPass: String!
    var houseImageNameToPass: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Reads dictionary for list of houses
        
        let path = Bundle.main.path(forResource: "HouseTableList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!) as! Dictionary<String,String>
        
        let index = 0
        for (key, value) in dict {
            
            let photoName = UIImage(named: value)!
            let tempHouse = House(name: key, photo: photoName)!
            
            housesFromList += [tempHouse]
            print("\(housesFromList[index].name)  image \(housesFromList[index].photo)")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return housesFromList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HouseTableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HouseTableViewCell
        
        // Configure the cell...
        let houseCell = housesFromList[indexPath.row]
        cell.HouseName.text = houseCell.name
        cell.HouseImage.image = houseCell.photo
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        let index = tableView.indexPathForSelectedRow!
        let house = housesFromList[index.row]
        let houseNameToPass = house
        
        print("houseNameToPass \(houseNameToPass)")
        print("\nhouse \(house)")
        
        // initialize new view controller and cast it as your view controller
        let viewController = segue.destination as! SelectedHouseViewController
        
        
        // your new view controller should have property that will store passed value
        viewController.passedHouseValue = housesFromList[index.row]
        
    }
}
