//
//  SelectedHouseViewController.swift
//  VirtualHomeTour
//
//  Created by benake on 11/30/15.
//  Copyright (c) 2015 Pooja. All rights reserved.
//

import UIKit

class SelectedHouseViewController: UIViewController {
    @IBOutlet weak var HouseDetailsName: UILabel!
    @IBOutlet weak var HouseDetailsImage: UIImageView!
    @IBOutlet weak var StartTour: UIButton!
    
    var passedValue: String!
    var passedImage: UIImage!
    
    var passedHouseValue: House?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nameOfSelectedHouse = (passedHouseValue?.name)!
        print(nameOfSelectedHouse)
        self.HouseDetailsName.text = "Selected: \(nameOfSelectedHouse)"
        self.HouseDetailsImage.image = passedHouseValue?.photo
    }
    
    override var shouldAutorotate : Bool {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        let orientation: UIInterfaceOrientationMask = [UIInterfaceOrientationMask.portrait, UIInterfaceOrientationMask.portraitUpsideDown]
        return orientation
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        let houseNameToPass = passedHouseValue
        
        // initialize new view controller and cast it as your view controller
        let viewController = segue.destination as! RoomViewController
        
        // your new view controller should have property that will store passed value
        viewController.passedHouseValue = houseNameToPass
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
