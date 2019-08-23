//
//  WorkoutTimerViewController.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutTimerViewController: UIViewController, CountdownTimerDelegate {
    
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var countdownTimerDidStart = false
    
    
    lazy var countdownTimer: CountdownTimer = {
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    let selectedSecs: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownTimer.delegate = self
        countdownTimer.setTimer(minutes: 0, seconds: 0)
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        
    }
    
    //MARK: - Countdown timer delegate
    
    func countdownTime(time: (minutes: String, seconds: String)) {
        minutesLabel.text = time.minutes
        secondsLabel.text = time.seconds
    }
    
    func countdownTimerDone() {
        secondsLabel.text = String(selectedSecs)
        countdownTimerDidStart = false
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        startButton.setTitle("Start", for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func startTimerButton(_ sender: Any) {
        stopButton.isEnabled = true
        stopButton.alpha = 1.0
        
        if !countdownTimerDidStart{
            countdownTimer.start()
            countdownTimerDidStart = true
            startButton.setTitle("Pause", for: .normal)
        } else {
            countdownTimer.pause()
            countdownTimerDidStart = false
            startButton.setTitle("Resume", for: .normal)
        }
    }
    
    @IBAction func stopTimerButton(_ sender: Any) {
        countdownTimer.stop()
        countdownTimerDidStart = false
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        startButton.setTitle("Start", for: .normal)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
