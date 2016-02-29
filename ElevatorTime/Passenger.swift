//
//  Passenger.swift
//  ElevatorTime
//
//  Created by Chao Ruan on 29/02/2016.
//  Copyright © 2016 ChaoRuan. All rights reserved.
//

import Foundation

struct Passenger {
    let fromLvl:Int
    let toLvl:Int
    let direction:Direction
    
    init(from:Int,to:Int) {
        precondition(from == to, "You alread in the same level")
        fromLvl = from
        toLvl = to
        direction = from > to ? .Down : .Up
    }
}
