//
//  WorkoutTimerViewController.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutTimerViewController: UIViewController, CountdownTimerDelegate {
    
    @IBOutlet weak var timerHeaderGradient: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerImageView: UIView!
    
    var gradient = CAGradientLayer()
    var countdownTimerDidStart = false
    
    lazy var countdownTimer: CountdownTimer = {
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownTimer.delegate = self
        SetGradient.setGradient(view: timerHeaderGradient, chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false, verticalFlip: false)
        gradient = setGradient(chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false)
        setupTimerImage(gradient: gradient)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countdownTimer.startTimer()
        countdownTimerDidStart = true
    }
    
    // MARK: - Countdown timer delegate
    func countdownTime(time: (minutes: String, seconds: String)) {
        minutesLabel.text = time.minutes
        secondsLabel.text = time.seconds
    }
    
    func updateTimerImage(percentage: Double) {
        let sublayers = timerImageView.layer.sublayers
        guard let firstLayer = sublayers?[0] else {return}
        firstLayer.removeFromSuperlayer()
        setupTimerImage(gradient: gradient, percentageComplete: percentage)
    }
    
    func killTimer() {
        CountdownTimer.sharedInstance.stop()
    }
    
    // MARK: - Actions
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startTimerButton(_ sender: Any) {
        
        if !countdownTimerDidStart{
            countdownTimer.startTimer()
            countdownTimerDidStart = true
            startButton.setImage(UIImage(named: "Pause Button"), for: .normal)
        } else {
            countdownTimer.pause()
            countdownTimerDidStart = false
            startButton.setImage(UIImage(named: "PlayButton"), for: .normal)
        }
    }
    
    @IBAction func stopTimerButton(_ sender: Any) {
        countdownTimer.stop()
        countdownTimerDidStart = false
        startButton.setTitle("Start", for: .normal)
        CountdownTimer.sharedInstance.currentTime = CountdownTimer.sharedInstance.duration
        CountdownTimer.sharedInstance.percentageComplete = 0
        let sublayers = timerImageView.layer.sublayers
        guard let firstLayer = sublayers?[0] else {return}
        firstLayer.removeFromSuperlayer()
        
        setupTimerImage(gradient: gradient)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        gradient = setGradient(chooseTwo: false, primaryBlue: true, accentOrange: false, accentBlue: true)
        
        let sublayers = timerImageView.layer.sublayers
        guard let firstLayer = sublayers?[0] else {return}
        firstLayer.removeFromSuperlayer()
        
        setupTimerImage(gradient: gradient)
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
        gradient = setGradient(chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false)
        
        let sublayers = timerImageView.layer.sublayers
        guard let firstLayer = sublayers?[0] else {return}
        firstLayer.removeFromSuperlayer()
        
        setupTimerImage(gradient: gradient)
    }
    
    
    // Mark: - Helper Functions
    func setGradient(chooseTwo primaryOrange: Bool, primaryBlue: Bool, accentOrange: Bool, accentBlue: Bool) -> CAGradientLayer {
        
        var color1: UIColor = .getHIITPrimaryOrange
        var color2: UIColor = .getHIITAccentOrange
        
        switch (primaryOrange, primaryBlue, accentOrange, accentBlue) {
        case (true, true, false, false):
            color1 = .getHIITPrimaryOrange
            color2 = .getHIITPrimaryBlue
        case (true, false, true, false):
            color1 = .getHIITPrimaryOrange
            color2 = .getHIITAccentOrange
        case (false, true, false, true):
            color1 = .getHIITPrimaryBlue
            color2 = .getHIITAccentBlue
        default:
            print("That gradient didnt work")
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color2.cgColor, color1.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height)
        
        return gradient
    }
    
    func setupTimerImage(gradient: CAGradientLayer, percentageComplete: Double = 0) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: timerImageView.bounds.midX, y: timerImageView.bounds.midY), radius: CGFloat(view.frame.width/3), startAngle: CGFloat( Double.pi * 17/12 - percentageComplete * Double.pi * 22/12), endAngle: CGFloat( -Double.pi * 5/12), clockwise: false)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.lineCap = .round
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.getHIITBlack.cgColor
        // Multiplier is the ratio from the sketch file
        shapeLayer.lineWidth = view.frame.width * (14/375)
        
        gradient.frame = timerImageView.bounds
        gradient.mask = shapeLayer
        gradient.type = .conic
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)
        
        timerImageView.layer.insertSublayer(gradient, at: 0)
    }
    
    // Mark: - Prepare For Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
