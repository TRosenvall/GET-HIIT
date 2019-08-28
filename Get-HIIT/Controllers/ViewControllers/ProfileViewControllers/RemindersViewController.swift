//
//  RemindersViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/21/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit
import EventKit

class RemindersViewController: UIViewController {
    

    @IBOutlet weak var reminderToggle: NSLayoutConstraint!
    @IBOutlet weak var reminderTimePicker: UIDatePicker!
    @IBOutlet weak var remindMeLabel: UILabel!
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupViews()
    }
    
        
    
    @IBAction func DatePickerTapped(_ sender: Any) {
        
    }
    
    @IBAction func RemindersToggled(_ sender: Any) {
        
    }
}

