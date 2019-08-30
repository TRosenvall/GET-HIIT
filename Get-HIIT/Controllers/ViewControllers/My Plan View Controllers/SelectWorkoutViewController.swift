//
//  SelectWorkoutViewController.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/29/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class SelectWorkoutViewController: UIViewController {
    
    @IBOutlet weak var exerciseTableView: UITableView!
    @IBOutlet weak var titleView: UIView!
    var selected: [Int] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetGradient.setGradient(view: titleView, chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false)
        titleView.layer.shadowOpacity = 0.3
        titleView.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Identifier
        if segue.identifier == "selectWorkoutCell" {
            //Index and Destination
            guard let indexPath = exerciseTableView.indexPathForSelectedRow, let destinationVC = segue.destination as? DescriptionViewController else {return}
            //Object to Send
            let exercise = ExerciseController.sharedExercises.workouts[indexPath.row]
            //Object to Set
            destinationVC.exerciseLandingPad = exercise
        }
    }
    
    
}

extension SelectWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExerciseController.sharedExercises.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectWorkoutCell", for: indexPath) as! SelectWorkoutTableViewCell
        let exercise = ExerciseController.sharedExercises.workouts[indexPath.row]
        cell.workoutNameLabel.text = exercise.name
        cell.borderView.layer.cornerRadius = cell.borderView.frame.height/2
        cell.borderView.layer.borderWidth = 3
        if selected.contains(indexPath.row) {
            cell.borderView.layer.borderColor = UIColor.getHIITPrimaryOrange.cgColor
        } else {
            cell.borderView.layer.borderColor = UIColor.getHIITGray.cgColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return exerciseTableView.frame.height / CGFloat(ExerciseController.sharedExercises.workouts.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selected.contains(indexPath.row) {
            guard let index = selected.firstIndex(of: indexPath.row) else {return}
            selected.remove(at: index)
        } else {
            if selected.count == 4 {
                selected.remove(at: 0)
            }
            selected.append(indexPath.row)
        }
        exerciseTableView.reloadData()
    }
}
