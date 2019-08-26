//
//  Workout.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/21/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class Workout {
    
    var name: String
    var description: String
    var duration: CountdownTimer
    
    init(name: String, description: String, duration: CountdownTimer) {
        
        self.name = name
        self.description = description
        self.duration = duration
    }
}
