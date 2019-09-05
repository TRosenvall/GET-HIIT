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
 
    @IBOutlet weak var titleView: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradient(view: titleView, chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false, verticalFlip: false)
        titleView.layer.shadowOpacity = 0.3
        titleView.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    @IBAction func DatePickerTapped(_ sender: Any) {
        
    }
    
    @IBAction func RemindersToggled(_ sender: Any) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setGradient(view: UIView, chooseTwo primaryOrange: Bool, primaryBlue: Bool, accentOrange: Bool, accentBlue: Bool, verticalFlip: Bool = false) {
        
        var color1: UIColor = .getHIITPrimaryOrange
        var color2: UIColor = .getHIITAccentOrange
        var placeholder: UIColor = UIColor()
        
        switch (primaryOrange, primaryBlue, accentOrange, accentBlue) {
        case (true, true, false, false):
            color1 = .getHIITPrimaryOrange
            color2 = .getHIITPrimaryBlue
        case (true, false, true, false):
            color1 = .getHIITPrimaryOrange
            color2 = .getHIITAccentOrange
        case (false, true, false, true):
            color1 = .getHIITPrimaryBlue
            color2 = .getHIITAccentBlue
        default:
            print("That gradient didnt work")
        }
        
        if verticalFlip == true {
            placeholder = color1
            color1 = color2
            color2 = placeholder
            placeholder = UIColor()
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
}

