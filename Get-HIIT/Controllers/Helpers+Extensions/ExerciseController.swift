//
//  ExerciseController.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class ExerciseController {
    
    static let sharedExercises = ExerciseController()
    
    var workouts: [Workout] {
        let burpee = Workout(name: "Burpee", description: "cry for 10 minutes")
        let crunches = Workout(name: "Crunches", description: "time to break that spine")
        let yourMom = Workout(name: "Your Mom", description: "Oh sorry was that too far?")
        let fatty = Workout(name: "Fatty", description: "Don't deny it.")
        let mountainClimber = Workout(name: "Mountain Climber", description: "meant to break your soul")
        let run = Workout(name: "Run", description: "If you don't know how to do this come find me for the zombie apocalypse")
    }
    
    func createWorkout() {
        
    }
    
    func updateWorkout() {
        
    }
    
    func deleteWorkout() {
        
    }
    
}
