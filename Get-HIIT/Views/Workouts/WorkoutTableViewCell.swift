//
//  WorkoutTableViewCell.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exerciseView: UIView!
    @IBOutlet weak var restView: UIView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func startExerciseButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func addExerciseButtonTapped(_ sender: Any) {
        
    }
    
}
