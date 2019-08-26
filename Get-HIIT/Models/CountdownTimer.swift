//
//  CountdownTimer.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/21/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

protocol  CountdownTimerDelegate: class {
//    func countdownTimerDone()
    func countdownTime(time: (minutes: String, seconds: String))
}

class CountdownTimer {
    
    weak var delegate: CountdownTimerDelegate?
//
//    fileprivate var seconds = 0.0
//    fileprivate var duration = 0.0
//    static var durationDummy = 60
//
//    // accessing the timer function in UIKit
//    lazy var timer: Timer = {
//        let timer = Timer()
//        return timer
//    }()
//
//    public func setTimer(minutes: Int, seconds: Int) {
//        let minutesToSeconds = minutes * 60
//        let secondsToSeconds = seconds
//
//        let seconds = secondsToSeconds + minutesToSeconds
//        self.seconds = Double(seconds)
//        self.duration = Double(seconds)
//    }
//
//    public func start() {
//        runTimer()
//    }
//
//    public func stop() {
//        timer.invalidate()
//        duration = seconds
//    }
//
//    fileprivate func runTimer() {
//        timer = Timer.scheduledTimer(timeInterval: TimeInterval(CountdownTimer.durationDummy), target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//    }
//
//    @objc fileprivate func updateTimer() {
//        if duration < 0.0 {
//            timer.invalidate()
//            timerDone()
//        } else {
//            duration -= 1
//            delegate?.countdownTime(time: timeString(time: TimeInterval(duration)))
//        }
//        WorkoutTimerViewController.sharedInstance.countdownTime(time: (minutes: "00", seconds: "\(CountdownTimer.durationDummy)"))
//    }
//
//    fileprivate func timeString(time: TimeInterval) -> (minutes: String, seconds: String) {
//        let minutes = Int(time) / 60 % 60
//        let seconds = Int(time) % 60
//
//        return (minutes: String(format:"%02i", minutes), seconds: String(format:"%02i", seconds))
//    }
//
//    fileprivate func timerDone() {
//        timer.invalidate()
//        duration = seconds
//        delegate?.countdownTimerDone()
//    }
    
    static let sharedInstance = CountdownTimer()
    
    var duration: Double = 300
    var timeInterval: Double = 1
    var minutes: String = "00"
    var seconds: String = "00"
    
    lazy var timer: Timer = {
        let timer = Timer()
        return timer
    }()
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { (timer) in
            let minutesInt = Int( self.duration ) / 60
            let secondsInt = Int( self.duration ) % 60
            self.minutes = "\(minutesInt)"
            self.seconds = "\(secondsInt)"
            
            self.delegate?.countdownTime(time: (minutes: self.minutes, seconds: self.seconds))
            
            self.duration -= 1
        })
    }
    
    func pause() {
        timer.invalidate()
    }
    
    func stop() {
        timer.invalidate()
    }
    
    
}
