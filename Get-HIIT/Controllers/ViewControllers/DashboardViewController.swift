//
//  DashboardViewController.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/29/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var weeklyWorkoutMinLabel: UILabel!
    @IBOutlet weak var weeklyCalLabel: UILabel!
    @IBOutlet weak var dashboardGradient: UIView!
    @IBOutlet weak var weeklyAvgHeartRateLabel: UILabel!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        SetGradient.setGradient(view: dashboardGradient, mainColor: UIColor.getHIITPrimaryOrange, secondColor: UIColor.getHIITAccentOrange)
        dashboardGradient.layer.shadowOpacity = 0.3
        dashboardGradient.layer.shadowOffset = CGSize(width: 0, height: 3)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ProfileController.sharedInstance.profile.firstLogin {
            let storyboard = UIStoryboard(name: "Profile", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "aboutMeViewController")
            self.present(viewController, animated: false, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
