//
//  Person.swift
//  VirtualHomeTour
//
//  Created by Pooja on 11/30/15.
//  Copyright (c) 2015 Pooja. All rights reserved.
//

import Foundation

class person {
    //properties
    var currentRoom: room? = nil
    var currentFace: String
    
    init?(currFace: String, currRoom: room){
        self.currentFace = currFace
        self.currentRoom = currRoom
        //initialization if fails due to no name
        if (currentFace.isEmpty) {
            return nil
        }
    }
}
