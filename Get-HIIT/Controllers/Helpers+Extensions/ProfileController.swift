//
//  ProfileController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class ProfileController {
    
    static let sharedInstance = ProfileController()
    
    var profile: Profile = Profile()
    
    func updateProfile (name: String?, gender: Int?, healthKitIsOn: Bool?, remindersEnabled: Bool?, notificationsEnabled: Bool?, age: Int?, goal: Int?, idealPlan: Int?, exercisesThisWeek: Int?, completedExercises: Int?, totalTimeExercising: Int?, weight: Double?, averageHeartRate: Double?, caloriesBurnedToday: Double?, totalCaloriesBurned: Double?, weightsForWeeklyPlot: [Double]?, caloriesBurnedThisWeek: [Double]?) {
        if let name = name {
            self.profile.name = name
        }
        if let gender = gender {
            self.profile.gender = gender
        }
        if let healthKitIsOn = healthKitIsOn {
            self.profile.healthKitIsOn = healthKitIsOn
        }
        if let remindersEnabled = remindersEnabled {
            self.profile.remindersEnabled = remindersEnabled
        }
        if let notificationsEnabled = notificationsEnabled {
            self.profile.notificationsEnabled = notificationsEnabled
        }
        if let age = age {
            self.profile.age = age
        }
        if let goal = goal {
            self.profile.goal = goal
        }
        if let idealPlan = idealPlan {
            self.profile.idealPlan = idealPlan
        }
        if let exercisesThisWeek = exercisesThisWeek {
            self.profile.exercisesThisWeek = exercisesThisWeek
        }
        if let completedExercises = completedExercises {
            self.profile.completedExercises = completedExercises
        }
        if let totalTimeExercising = totalTimeExercising {
            self.profile.totalTimeExercising = totalTimeExercising
        }
        if let weight = weight {
            self.profile.weight = weight
        }
        if let averageHeartRate = averageHeartRate {
            self.profile.averageHeartRate = averageHeartRate
        }
        if let caloriesBurnedToday = caloriesBurnedToday {
            self.profile.caloriesBurnedToday = caloriesBurnedToday
        }
        if let totalCaloriesBurned = totalCaloriesBurned {
            self.profile.totalCaloriesBurned = totalCaloriesBurned
        }
        if let weightsForWeeklyPlot = weightsForWeeklyPlot {
            self.profile.weightsForWeeklyPlot = weightsForWeeklyPlot
        }
        if let caloriesBurnedThisWeek = caloriesBurnedThisWeek {
            self.profile.caloriesBurnedThisWeek = caloriesBurnedThisWeek
        }
    }
}
