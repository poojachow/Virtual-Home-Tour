//
//  RoomViewController.swift
//  VirtualHomeTour
//
//  Created by Pooja on 11/30/15.
//  Copyright (c) 2015 Pooja. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController {

    @IBOutlet weak var RoomImage: UIImageView!
    @IBOutlet weak var RoomName: UILabel!
    
    var passedHouseValue: House?
    
    var dictRoom = Dictionary<String,Dictionary<String,String>>()
    var dictPerson = Dictionary<String,Dictionary<String,String>>()
    var dictCurrRoom = Dictionary<String,String>()
    var dictCurrPerson = Dictionary<String,String>()
    
    var currentRoom: room?
    var currentPerson: person?
    var currentFace: String?

    @IBOutlet weak var UpButton: UIButton!
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var DownButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    
    
    @IBAction func UpButton(_ sender: UIButton) {
        if (currentPerson?.currentFace == "North"){
            if ((currentRoom?.northRoom) != "") {
                let value:String = (currentRoom?.northRoom)!
                dictCurrRoom = dictRoom[value]!
                dictCurrPerson = dictPerson[value]!
                print(dictCurrRoom)
                setRoom()
                currentFace = "North"
                setView()
                displayRoomView()
            }
        }
        else if (currentPerson?.currentFace == "East"){
            if ((currentRoom?.eastRoom) != "") {
                let value:String = (currentRoom?.eastRoom)!
                dictCurrRoom = dictRoom[value]!
                dictCurrPerson = dictPerson[value]!
                print(dictCurrRoom)
                setRoom()
                currentFace = "North"
                setView()
                displayRoomView()
            }
        }
        else if (currentPerson?.currentFace == "South"){
            if ((currentRoom?.southRoom) != "") {
                let value:String = (currentRoom?.southRoom)!
                dictCurrRoom = dictRoom[value]!
                dictCurrPerson = dictPerson[value]!
                print(dictCurrRoom)
                setRoom()
                currentFace = "North"
                setView()
                displayRoomView()
            }
        }
        else if (currentPerson?.currentFace == "West"){
            if ((currentRoom?.westRoom) != "") {
                let value:String = (currentRoom?.westRoom)!
                dictCurrRoom = dictRoom[value]!
                dictCurrPerson = dictPerson[value]!
                print(dictCurrRoom)
                setRoom()
                currentFace = "North"
                setView()
                displayRoomView()
            }
        }
    }
    
    @IBAction func LeftButton(_ sender: UIButton) {
        if (currentPerson?.currentFace == "North") {
            if ((currentRoom?.westView) != ""){
                currentFace = "West"
            }
        }
        else if (currentPerson?.currentFace == "West") {
            if ((currentRoom?.southView) != ""){
                currentFace = "South"
            }
        }
        else if (currentPerson?.currentFace == "South") {
            if ((currentRoom?.eastView) != ""){
                currentFace = "East"
            }
        }
        else if (currentPerson?.currentFace == "East") {
            if ((currentRoom?.northView) != ""){
                currentFace = "North"
            }
        }
        setView()
        displayRoomView()
    }
    
    @IBAction func RightButton(_ sender: UIButton) {
        if (currentPerson?.currentFace == "North") {
            if ((currentRoom?.eastView) != ""){
                currentFace = "East"
            }
        }
        else if (currentPerson?.currentFace == "East") {
            if ((currentRoom?.southView) != ""){
                currentFace = "South"
            }
        }
        else if (currentPerson?.currentFace == "South") {
            if ((currentRoom?.westView) != ""){
                currentFace = "West"
            }
        }
        else if (currentPerson?.currentFace == "West") {
            if ((currentRoom?.northView) != ""){
                currentFace = "North"
            }
        }
        setView()
        displayRoomView()
    }
    
    @IBAction func DownButton(_ sender: UIButton) {
        if (currentPerson?.currentFace == "North") {
            if ((currentRoom?.southView) != ""){
                currentFace = "South"
            }
        }
        else if (currentPerson?.currentFace == "East") {
            if ((currentRoom?.westView) != ""){
                currentFace = "West"
            }
        }
        else if (currentPerson?.currentFace == "South") {
            if ((currentRoom?.northView) != ""){
                currentFace = "North"
            }
        }
        else if (currentPerson?.currentFace == "West") {
            if ((currentRoom?.eastView) != ""){
                currentFace = "East"
            }
        }
        setView()
        displayRoomView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Reads the corresponding plist dependig on the house name passed via segue
        
        let path = Bundle.main.path(forResource: passedHouseValue?.name, ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!) as! Dictionary<String,Dictionary<String,Dictionary<String,String>>>
        
        dictRoom = dict["Room"]!
        dictPerson = dict["Person"]!
        dictCurrRoom = dictRoom["Room1"]!
        dictCurrPerson = dictPerson["Room1"]!
        
//        NotificationCenter.default.addObserver(self, selector: #selector(RoomViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
//        setButtonPotrait()
        
        setRoom()
        currentFace = "North"
        setView()
        displayRoomView()
    }
    
    func setRoom() {
        var roomName: String
        var northView: String
        var southView: String
        var eastView: String
        var westView: String
        
        roomName = dictCurrPerson["RoomName"]!
        northView = dictCurrPerson["North"]!
        southView = dictCurrPerson["South"]!
        eastView = dictCurrPerson["East"]!
        westView = dictCurrPerson["West"]!
        
        let roomDescription: String = dictCurrRoom["RoomName"]!
        let northRoom: String = dictCurrRoom["North"]!
        let southRoom: String = dictCurrRoom["South"]!
        let eastRoom: String = dictCurrRoom["East"]!
        let westRoom: String = dictCurrRoom["West"]!
        
        currentRoom = room(name: roomName, description: roomDescription, nVeiw: northView, sView: southView, eView: eastView, wView: westView)!
        currentRoom?.setAdjacentRooms(northRoom, sRoom: southRoom, eRoom: eastRoom, wRoom: westRoom)
        
    }
    
    func setView() {
        currentPerson = person(currFace: currentFace!, currRoom: currentRoom!)
    }
    
    func displayRoomView() {
        RoomName.text = currentRoom?.roomDescription
        var imageName: String?
        if (currentPerson?.currentFace == "North") {
            imageName = currentRoom?.northView
            RoomImage.image = UIImage(named: imageName!)
            if  (currentRoom?.northRoom == "") {
                UpButton.isHidden = true
            }
            else {
                UpButton.isHidden = false
            }
        }
        else if (currentPerson?.currentFace == "South") {
            imageName = currentRoom?.southView
            RoomImage.image = UIImage(named: imageName!)
            if  (currentRoom?.southRoom == "") {
                UpButton.isHidden = true
            }
            else {
                UpButton.isHidden = false
            }
        }
        else if (currentPerson?.currentFace == "East") {
            imageName = currentRoom?.eastView
            RoomImage.image = UIImage(named: imageName!)
            if  (currentRoom?.eastRoom == "") {
                UpButton.isHidden = true
            }
            else {
                UpButton.isHidden = false
            }
        }
        else if (currentPerson?.currentFace == "West") {
            imageName = currentRoom?.westView
            RoomImage.image = UIImage(named: imageName!)
            if  (currentRoom?.westRoom == "") {
                UpButton.isHidden = true
            }
            else {
                UpButton.isHidden = false
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
