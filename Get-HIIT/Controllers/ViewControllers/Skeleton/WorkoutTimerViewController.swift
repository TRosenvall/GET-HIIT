//
//  WorkoutTimerViewController.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutTimerViewController: UIViewController, CountdownTimerDelegate {
    
    
    
    
    var countdownTimerDidStart = false
    
    
    lazy var countdownTimer: CountdownTimer = {
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Countdown timer delegate
    
    func countdownTime(time: (minutes: String, seconds: String)) {
        
    }
    
    func countdownTimerDone() {
        
    }
    
    // MARK: - Actions
    
    @IBAction func startTimerButton(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
