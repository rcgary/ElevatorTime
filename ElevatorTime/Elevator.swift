//
//  Elevator.swift
//  ElevatorTime
//
//  Created by Chao Ruan on 29/02/2016.
//  Copyright © 2016 ChaoRuan. All rights reserved.
//

import Foundation

enum Direction : Int {
    case Up = 1
    case Down = -1
    case Stationary = 0
}

struct Elevator {
    let capacity = 20
    let id:String
    var availableCount = 20
    var direction = Direction.Stationary
    var destinations = [Int]()
    var passengers = [Passenger]() {
        didSet {
            availableCount = capacity - passengers.count
        }
    }
     var currentLvl = 0 {
        didSet {
            destinations = destinations.filter{$0 == currentLvl}
            passengers = passengers.filter{$0.toLvl == currentLvl}
            
        }
    }
    
    init(id:String, currentLvl:Int) {
        self.id = id
        self.currentLvl = currentLvl
    }
    
    mutating func move(toLvl:Int) {
        guard currentLvl != toLvl else {
            direction = .Stationary
            return
        }
        
        direction = currentLvl < toLvl ? .Up : .Down
        print("Move to lvl \(toLvl)")
        currentLvl = toLvl
    }
    
    mutating func addPassengers(newPassengers:[Passenger]?) {
        guard let newPassengers = newPassengers where newPassengers.count <= availableCount else {
            return
        }
        
        destinations += newPassengers.map{$0.toLvl}
        passengers += newPassengers
    }
    
    func status() -> String {
        return "Elevator \(id) on \(currentLvl) with \(passengers.count) passengers, will start moving \(direction)"
    }
}
