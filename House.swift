//
//  House.swift
//  VirtualHomeTour
//
//  Created by benake on 11/30/15.
//  Copyright (c) 2015 Pooja. All rights reserved.
//

import UIKit

class House {
    //properties
    var name: String
    var photo: UIImage?
    
    init?(name: String, photo: UIImage?){
        self.name = name
        self.photo = photo
        
        //initialization if fails due to no name
        if name.isEmpty {
            return nil
        }
    }
}