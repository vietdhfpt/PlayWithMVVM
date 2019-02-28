//
//  Car.swift
//  PlayWithMVVM
//
//  Created by Do Hoang Viet on 2/28/19.
//  Copyright © 2019 Do Hoang Viet. All rights reserved.
//

import Foundation

class Car {
    var model: String
    var make: String
    var kilowatts: Int
    var photoURL: String
    
    init(model: String, make: String, kilowatts: Int, photoURL: String) {
        self.model = model
        self.make = make
        self.kilowatts = kilowatts
        self.photoURL = photoURL
    }
}
