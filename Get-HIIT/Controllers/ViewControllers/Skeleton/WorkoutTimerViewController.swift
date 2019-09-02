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
    @IBOutlet weak var setNumberLabel: UILabel!
    @IBOutlet weak var exerciseNumberLabel: UILabel!
    
    var gradient = CAGradientLayer()
    var countdownTimerDidStart = false
    var workouts: Workouts = WorkoutsController.sharedInstance.totalWorkouts[WorkoutMainViewController.lastSelectedIndex]
    var exercises: [(String, Double, String)] = []
    var currentExercise: Int = 0
    var percentage: Double = 0
    static var totalTime: Double = 0
    
    lazy var multiplier = workouts.multiplier
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CountdownTimer.sharedInstance.newTimer = true
        setExercises()
        setupLabels { (finished) in
            if finished {
                DispatchQueue.main.async {
                    self.countdownTimer.startTimer()
                    self.countdownTimerDidStart = true
                }
            }
        }
    }
    
    func setupLabels(completion: @escaping (Bool) -> Void) {
        let curr = currentExercise % exercises.count
        workoutNameLabel.text = exercises[curr].0
        workoutImage.image = UIImage(named: exercises[curr].2)
        CountdownTimer.sharedInstance.duration = exercises[curr].1
        CountdownTimer.sharedInstance.currentTime = exercises[curr].1
        CountdownTimer.sharedInstance.percentageComplete = 0
        
        setNumberLabel.text = "\(currentExercise / exercises.count + 1)"
        if (curr + 1) % 2 != 0 {
            exerciseNumberLabel.text = "\(((curr + 1) / 2) + 1)"
        }
        completion(true)
    }
    
    func setExercises() {
        let workout = workouts.workouts
        for exercise in workout {
            let exerciseTuple = (exercise.name, Double(exercise.duration), exercise.image)
            let restTuple = ("Rest", Double(exercise.rest), "GetReady")
            exercises.append(exerciseTuple)
            exercises.append(restTuple)
        }
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
        self.percentage = percentage
    }
    
    func killTimer() {
        nextExercise()
    }
    
    // MARK: - Actions
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        CountdownTimer.sharedInstance.newTimer = true
        countdownTimer.pause()
        countdownTimerDidStart = false
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
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        nextExercise()
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
        countdownTimer.stop()
        countdownTimerDidStart = false
        if currentExercise > 0 {
            currentExercise -= 1
            setupLabels { (finished) in
                if finished {
                    DispatchQueue.main.async {
                        if self.exercises[self.currentExercise].0 == "Rest" {
                            self.setBlue()
                        } else {
                            self.setOrange()
                        }
                        self.countdownTimer.startTimer()
                        self.countdownTimerDidStart = true
                    }
                }
            }
            CountdownTimer.sharedInstance.newTimer = true
        } else {
            countdownTimer.startTimer()
            countdownTimerDidStart = true
            CountdownTimer.sharedInstance.newTimer = false
        }
    }
    
    // Mark: - Helper Functions
    func nextExercise() {
        let currentWorkoutTime = exercises[currentExercise % exercises.count].1
        print(currentWorkoutTime)
        WorkoutTimerViewController.totalTime += (percentage) * currentWorkoutTime
        WorkoutTimerViewController.totalTime = Double((Int(WorkoutTimerViewController.totalTime * 100)))/100
        print(WorkoutTimerViewController.totalTime)
        countdownTimer.stop()
        self.countdownTimerDidStart = false
        if currentExercise >= (exercises.count * multiplier) - 1 {
            countdownTimer.pause()
            countdownTimerDidStart = false
            CountdownTimer.sharedInstance.newTimer = true
            currentExercise = 0
            setOrange()
            let currStoryboard = UIStoryboard(name: "Workout", bundle: nil)
            let vc = currStoryboard.instantiateViewController(withIdentifier: "workoutView")
            present(vc, animated: true, completion: nil)
        } else {
            currentExercise += 1
            setupLabels { (finished) in
                if finished {
                    DispatchQueue.main.async {
                        if self.exercises[self.currentExercise % self.exercises.count].0 == "Rest" {
                            self.setBlue()
                        } else {
                            self.setOrange()
                        }
                        self.countdownTimer.startTimer()
                        self.countdownTimerDidStart = true
                    }
                }
            }
        }
        CountdownTimer.sharedInstance.newTimer = true
    }
    
    func setBlue() {
        gradient = setGradient(chooseTwo: false, primaryBlue: true, accentOrange: false, accentBlue: true)
        
        let sublayers = timerImageView.layer.sublayers
        guard let firstLayer = sublayers?[0] else {return}
        firstLayer.removeFromSuperlayer()
        
        setupTimerImage(gradient: gradient)
        
        let headerSublayers = timerHeaderGradient.layer.sublayers
        guard let headerFirstLayer = headerSublayers?[0] else {return}
        headerFirstLayer.removeFromSuperlayer()
        
        SetGradient.setGradient(view: timerHeaderGradient, chooseTwo: false, primaryBlue: true, accentOrange: false, accentBlue: true, verticalFlip: false)
    }
    
    func setOrange() {
        gradient = setGradient(chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false)
        
        let sublayers = timerImageView.layer.sublayers
        guard let firstLayer = sublayers?[0] else {return}
        firstLayer.removeFromSuperlayer()
        
        setupTimerImage(gradient: gradient)
        
        let headerSublayers = timerHeaderGradient.layer.sublayers
        guard let headerFirstLayer = headerSublayers?[0] else {return}
        headerFirstLayer.removeFromSuperlayer()
        
        SetGradient.setGradient(view: timerHeaderGradient, chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false, verticalFlip: false)
    }
    
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
}
