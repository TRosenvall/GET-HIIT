//
//  WorkoutEditViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/29/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutEditViewController: UIViewController {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var workoutTitleTextField: UITextField!
    @IBOutlet weak var workoutTableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    var workouts: Workouts?
    var timeTotal: Int = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let workout = workouts else {return}
        setGradient(view: titleView, chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false)
        titleView.layer.shadowOpacity = 0.3
        titleView.layer.shadowOffset = CGSize(width: 0, height: 3)
        workoutTitleTextField.text = workouts?.name
        
        multiplierLabel.layer.cornerRadius = multiplierLabel.frame.height/2
        multiplierLabel.layer.borderColor = UIColor.getHIITBlack.cgColor
        multiplierLabel.layer.borderWidth = 1
        multiplierLabel.text = "x\(workout.multiplier)"
        
        saveButton.layer.cornerRadius = saveButton.frame.height/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTotalTime()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func multiplierSubtractButtonTapped(_ sender: Any) {
        workouts?.multiplier -= 1
        if let multiplier = workouts?.multiplier {
            multiplierLabel.text = "x\(multiplier)"
        }
        setTotalTime()
    }
    
    @IBAction func multiplierAddButtonTapped(_ sender: Any) {
        workouts?.multiplier += 1
        if let multiplier = workouts?.multiplier {
            multiplierLabel.text = "x\(multiplier)"
        }
        setTotalTime()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let workouts = workouts else {return}
        guard let title = workoutTitleTextField.text else {return}
        guard var multiplierText = multiplierLabel.text else {return}
        guard let index = multiplierText.firstIndex(of: "x") else {return}
        multiplierText.remove(at: index)
        guard let multiplier = Int(multiplierText) else {return}
        WorkoutsController.sharedInstance.updateWorkout(workout: workouts, name: title, workouts: workouts.workouts, multiplier: multiplier)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setTotalTime() {
        var tempTimeTotal: Int = 0
        if let workouts = workouts?.workouts {
            for workout in workouts {
                tempTimeTotal += workout.duration + workout.rest
            }
        }
        if timeTotal != tempTimeTotal {
            timeTotal = tempTimeTotal
            tempTimeTotal = 0
        }
        guard let workouts = workouts else {return}
        timeTotal *= workouts.multiplier
        
        let minutes = timeTotal / 60
        var minutesLabel = ""
        let seconds = timeTotal % 60
        var secondsLabel = ""
        
        if minutes < 10 {
            minutesLabel = "0\(minutes)"
        } else {
            minutesLabel = "\(minutes)"
        }
        
        if seconds < 10 {
            secondsLabel = "0\(seconds)"
        } else {
            secondsLabel = "\(seconds)"
        }
        
        totalTimeLabel.text = minutesLabel + ":" + secondsLabel
    }
    
    func setGradient(view: UIView, chooseTwo primaryOrange: Bool, primaryBlue: Bool, accentOrange: Bool, accentBlue: Bool, verticalFlip: Bool = false) {
        
        var color1: UIColor = .getHIITPrimaryOrange
        var color2: UIColor = .getHIITAccentOrange
        var placeholder: UIColor = UIColor()
        
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
        
        if verticalFlip == true {
            placeholder = color1
            color1 = color2
            color2 = placeholder
            placeholder = UIColor()
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
}

extension WorkoutEditViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workoutEditCell", for: indexPath) as? WorkoutEditTableViewCell else {return UITableViewCell()}
        let workout = workouts?.workouts[indexPath.row]
        
        cell.workoutView.layer.cornerRadius = cell.workoutView.frame.height/2
        cell.workoutView.layer.borderColor = UIColor.getHIITPrimaryOrange.cgColor
        cell.workoutView.layer.borderWidth = 3
        
        cell.restView.layer.cornerRadius = cell.restView.frame.height/2
        cell.restView.layer.borderColor = UIColor.getHIITPrimaryBlue.cgColor
        cell.restView.layer.borderWidth = 3
        
        cell.workout = workout
        
        if let workout = workout {
            cell.workoutImageView.image = UIImage(named: workout.image)
            cell.workoutTitle.text = workout.name
        }
        
        if let duration = workout?.duration {
            let minutes = duration / 60
            let seconds = duration % 60
            cell.workoutTimeLabel.text = "\(minutes):\(seconds)"
        }
        if let rest = workout?.rest {
            let minutes = rest / 60
            let seconds = rest % 60
            cell.restTimeLabel.text = "\(minutes):\(seconds)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return workoutTableView.frame.height/4
    }
}


