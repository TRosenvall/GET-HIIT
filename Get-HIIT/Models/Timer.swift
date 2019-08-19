//
//  Timer.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/14/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

class Timer: NSObject {
    
    var timer: Timer?
    var timeRemaining: TimeInterval?
    var isOn: Bool? {
        return timeRemaining != nil
    }
    
    var timeAsString: String {
        let timeRemaining = Int(self.timeRemaining ?? 20 * 60)
        let minutesRemaining = timeRemaining / 60
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)
        return String(format: "%02d : %02d", arguments: [minutesRemaining, secondsRemaining])
    }
}
