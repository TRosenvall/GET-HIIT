//
//  WorkoutCompleteViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 9/2/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutCompleteViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var calorieCount: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var averageHeartRate: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       SetGradient.setGradient(view: titleView, mainColor: UIColor.getHIITPrimaryOrange, secondColor: UIColor.getHIITAccentOrange)
        titleView.layer.shadowOpacity = 0.3
        titleView.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
