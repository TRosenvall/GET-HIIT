//
//  WorkoutInProgressViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/16/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutInProgressViewController: UIViewController {

    @IBOutlet weak var imageButton: UIButton!
    
    var numberOfTaps: Int = 1
    static var fromPostExercise: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dismissFromPostExercise()
        numberOfTaps = 1
    }
    
    @IBAction func imageButtonTapped(_ sender: Any) {
        numberOfTaps += 1
        updateImage()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateImage() {
        let x = numberOfTaps
        if x < 6 {
            imageButton.setImage(UIImage(named: "Workout \(x) Screenshot"), for: .normal)
        } else {
            MainTabBarViewController.finishedExercise = 1
            let appSkeletonStoryboard = UIStoryboard(name: "AppSkeleton", bundle: nil)
            let postExerciseViewController = appSkeletonStoryboard.instantiateViewController(withIdentifier: "PostExerciseViewController")
            present(postExerciseViewController, animated: true) {
            }
            
            
        }
    }
    
    func dismissFromPostExercise() {
        if WorkoutInProgressViewController.fromPostExercise == 1 {
            WorkoutInProgressViewController.fromPostExercise = 0
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
    
    
}
