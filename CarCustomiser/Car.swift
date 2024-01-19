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
    var torque: Int
    
    init(make: String, model: String, topSpeed: Int, acceleration: Double, handling: Int, torque: Int) {
        self.make = make
        self.model = model
        self.topSpeed = topSpeed
        self.acceleration = acceleration
        self.handling = handling
        self.torque = torque
    }
    
    func displayStats() -> String {
        return """
        Make: \(self.make)
        Model: \(self.model)
        Top speed: \(self.topSpeed)mph
        Acceleration (0-60): \(self.acceleration)
        Handling: \(self.handling)
        Torque: \(self.torque)Nm
        """
    }
}

