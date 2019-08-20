//
//  WorkoutTimerViewController.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutTimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    var timer: Timer?
    
    
    @objc func updateTimer() {
        
    }
    
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            timer?.tolerance = 0.1

        }
    }

    
    // MARK: - Navigation

    @IBAction func startTimerButton(_ sender: Any) {
        
        timerLabel.text = "\(self.createTimer())"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
