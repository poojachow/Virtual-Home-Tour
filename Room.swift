//
//  Room.swift
//  VirtualHomeTour
//
//  Created by benake on 11/30/15.
//  Copyright (c) 2015 Pooja. All rights reserved.
//

import Foundation

class room {
    //properties
    var roomName: String
    var northView: String?
    var southView: String?
    var eastView: String?
    var westView: String?
    
    var roomDescription: String
    var northRoom: String?
    var southRoom: String?
    var eastRoom: String?
    var westRoom: String?
    
    init?(name: String, description: String, nVeiw: String, sView: String, eView: String, wView: String){
        self.roomName = name
        self.roomDescription = description
        self.northView = nVeiw
        self.southView = sView
        self.eastView = eView
        self.westView = wView
        
    }
    
    func setAdjacentRooms (_ nRoom: String, sRoom: String, eRoom: String, wRoom: String){
        self.northRoom = nRoom
        self.southRoom = sRoom
        self.eastRoom = eRoom
        self.westRoom = wRoom
    }
    
}
