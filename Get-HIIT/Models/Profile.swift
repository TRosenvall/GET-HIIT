//
//  Profile.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

class Profile {
    
    var name: String
    var gender: String
    var healthKitIsOn: Bool
    var remindersEnabled: Bool
    var notificationsEnabled: Bool
    var age: Int
    var goal: Int
    var idealPlan: Int
    var exercisesThisWeek: Int
    var completedExercises: Int
    var totalTimeExercising: Int
    var weight: Double
    var averageHeartRate: Double
    var caloriesBurnedToday: Double
    var totalCaloriesBurned: Double
    var weightsForWeeklyPlot: [Double]
    var caloriesBurnedThisWeek: [Double]
    
    init(name: String, gender: String, healthKitIsOn: Bool = false, remindersEnabled: Bool = false, notificationsEnabled: Bool = false, age: Int, goal: Int = 0, idealPlan: Int = 0, exercisesThisWeek: Int = 0, completedExercises: Int = 0, totalTimeExericising: Int = 0, weight: Double, averageHeartRate: Double = 0.0, caloriesBurnedToday: Double = 0.0, totalCaloriesBurned: Double = 0.0, weightsForWeeklyPlot: [Double] = [], caloriesBurnedThisWeek: [Double] = []) {
        self.name = name
        self.gender = gender
        self.healthKitIsOn = healthKitIsOn
        self.remindersEnabled = remindersEnabled
        self.notificationsEnabled = notificationsEnabled
        self.age = age
        self.goal = goal
        self.idealPlan = idealPlan
        self.exercisesThisWeek = exercisesThisWeek
        self.completedExercises = completedExercises
        self.totalTimeExercising = totalTimeExericising
        self.weight = weight
        self.averageHeartRate = averageHeartRate
        self.caloriesBurnedToday = caloriesBurnedToday
        self.totalCaloriesBurned = totalCaloriesBurned
        self.weightsForWeeklyPlot = weightsForWeeklyPlot
        self.caloriesBurnedThisWeek = caloriesBurnedThisWeek
    }
}
