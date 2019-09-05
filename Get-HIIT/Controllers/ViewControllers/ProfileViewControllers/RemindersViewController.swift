//
//  RemindersViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/21/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit
import EventKit

class RemindersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var reminderToggle: UISwitch!
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    
    let pickerData = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       SetGradient.setGradient(view: titleView, mainColor: UIColor.getHIITPrimaryOrange, secondColor: UIColor.getHIITAccentOrange)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @IBAction func reminderToggleTapped(_ sender: Any) {
        
        
    }
    
   
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
}

