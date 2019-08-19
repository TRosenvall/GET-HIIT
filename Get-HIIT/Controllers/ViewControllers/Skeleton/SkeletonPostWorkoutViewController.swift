//
//  SkeletonPostWorkoutViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/16/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class SkeletonPostWorkoutViewController: UIViewController {

    @IBOutlet weak var discardPromptImageView: UIImageView!
    @IBOutlet weak var promptSaveButton: UIButton!
    @IBOutlet weak var discardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SkeletonWorkoutInProgressViewController.fromPostExercise = 1
        discardPromptImageView.isHidden = true
        promptSaveButton.isHidden = true
        discardButton.isHidden = true
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        discardPromptImageView.isHidden = false
        promptSaveButton.isHidden = false
        discardButton.isHidden = false
    }
    
    @IBAction func promptSaveButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func discardButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
