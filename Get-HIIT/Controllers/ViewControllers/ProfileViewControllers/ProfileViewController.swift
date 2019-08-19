//
//  ProfileViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var numberOfExercisesLabel: UILabel!
    @IBOutlet weak var numberOfMinutesExercisedLabel: UILabel!
    @IBOutlet weak var numberOfCaloriesBurnedLabel: UILabel!
    @IBOutlet weak var numberOfExercisesThisWeekLabel: UILabel!
    
    @IBOutlet weak var aboutMeView: UIView!
    @IBOutlet weak var fitnessPlanView: UIView!
    @IBOutlet weak var remindersView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeView.layer.borderWidth = 1
        aboutMeView.layer.borderColor = UIColor.getHIITBlack.cgColor
        fitnessPlanView.layer.borderWidth = 1
        fitnessPlanView.layer.borderColor = UIColor.getHIITBlack.cgColor
        remindersView.layer.borderWidth = 1
        remindersView.layer.borderColor = UIColor.getHIITBlack.cgColor
    }
}
