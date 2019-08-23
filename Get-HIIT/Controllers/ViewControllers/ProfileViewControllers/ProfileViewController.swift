//
//  ProfileViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    // IBOutlets for the Views for the buttons and images.
    @IBOutlet weak var aboutMeView: UIView!
    @IBOutlet weak var fitnessPlanView: UIView!
    @IBOutlet weak var remindersView: UIView!
    // IBOutlets and variables.
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var numberOfExercisesLabel: UILabel!
    @IBOutlet weak var numberOfMinutesExercisedLabel: UILabel!
    @IBOutlet weak var numberOfCaloriesBurnedLabel: UILabel!
    @IBOutlet weak var numberOfExercisesThisWeekLabel: UILabel!
    // Source Of Truth
    var profile = ProfileController.sharedInstance.profile
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
    }
    
    func setupViews() {
        // Set the color and width for the segue buttons.
        aboutMeView.layer.borderWidth = 1
        aboutMeView.layer.borderColor = UIColor.getHIITBlack.cgColor
        fitnessPlanView.layer.borderWidth = 1
        fitnessPlanView.layer.borderColor = UIColor.getHIITBlack.cgColor
        remindersView.layer.borderWidth = 1
        remindersView.layer.borderColor = UIColor.getHIITBlack.cgColor
        // Set the name
        let name = profile.name
        if name == "" {
            greetingLabel.text = "Hey there!"
        } else {
            greetingLabel.text = "Hey \(name)!"
        }
        // Set the outlet numbers
        let numberOfExercises = profile.completedExercises
        let numberOfMinutes = profile.totalTimeExercising
        let numberOfCalories = profile.caloriesBurnedThisWeek.reduce(0, +)
        let numberOfExercisesThisWeek = profile.exercisesThisWeek
        // Set the proper labels
        numberOfExercisesLabel.text = "\(numberOfExercises)"
        numberOfMinutesExercisedLabel.text = "\(numberOfMinutes)"
        if numberOfCalories == 0 {
            numberOfCaloriesBurnedLabel.text = "0"
        } else {
            numberOfCaloriesBurnedLabel.text = "\(numberOfCalories)"
        }
        numberOfExercisesThisWeekLabel.text = "\(numberOfExercisesThisWeek)"
    }
}
