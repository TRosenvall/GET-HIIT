//
//  Time.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/14/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit
import SceneKit

class Time {
  
    var timer: Timer?
    
    
    @objc func updateTimer() {
        
    }
    
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
}
