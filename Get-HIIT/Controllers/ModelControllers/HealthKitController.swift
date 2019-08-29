//
//  HealthKitController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/21/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit
import HealthKit

class HealthKitController {
    // Singleton to keep the same HKHealthStore throughout the app.
    static let sharedInstance = HealthKitController()
    // Variables for healthKit
    // This is the HealthKit Store we will be accessing for all of our app
    let healthKitStore: HKHealthStore = HKHealthStore()
    var weights: [Double] = []
    var heartRates: [Double] = []
    var calories: [Double] = []
    var timestampsWeight: [Date] = []
    var timestampsHeartRate: [Date] = []
    var timestampsCalorie: [Date] = []
    // Units for HKObjects
    let weightUnit = HKUnit.pound()
    let heartRateUnit = HKUnit(from: "count/min")
    let calorieUnit = HKUnit.kilocalorie()
    
    // Function called to request authorization from the Health app.
    func authorizeHeatlhKitInApp( completion: @escaping (Bool) -> Void) {
        // Set the dateOfBirth, weight, heartRate, and activeEnergyBurned as unwrapped objects.
        guard let dateOfBirth = HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth) else
        {return}
        guard let weight = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) else
        {return}
        guard let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate) else {return}
        guard let activeCalorieExpendeture = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {return}
        
        // Request authorization for access to read the dateOfBirth, weight, heartRate, and activeEnergyBurned from the Health app.
        let healthKitTypesToRead: Set<HKObjectType> = [
            dateOfBirth,
            weight,
            heartRate,
            activeCalorieExpendeture,
        ]
        
        // Request authorization for access to write the weight, heartRate, and activeEnergyBurned to the Health app.
        let healthKitTypesToWrite: Set<HKSampleType> = [
            weight,
            heartRate,
            activeCalorieExpendeture,
        ]
        
        // Check whether or not the HealthKit Store is accessable.
        if !HKHealthStore.isHealthDataAvailable() {
            print( "Error Occured")
            return
        }
        
        // Authorize request for the items above.
        healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) in
            // Unwrap and handle any errors
            if let error = error {
                print(error.localizedDescription)
            } else {
                // Print off if it succeeded.
                print("Read/Write Authorization Request Successed")
            }
            // If the operation was successful, complete with true.
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
