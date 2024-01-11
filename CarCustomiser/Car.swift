//
//  Car.swift
//  CarCustomiser
//
//  Created by William Eze on 10/01/2024.
//

import Foundation

struct Car{
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    init(make: String, model: String, topSpeed: Int, acceleration: Double, handling: Int) {
        self.make = make
        self.model = model
        self.topSpeed = topSpeed
        self.acceleration = acceleration
        self.handling = handling
    }
    
    func displayStats() -> (make:String, model:String, topSpeed:Int, acceleration:Double, handling: Int) {

        return (make, model, topSpeed, acceleration, handling)
    }
    

}

