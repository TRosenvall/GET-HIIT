//
//  MyPlanViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/29/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class MyPlanViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var preferenceLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetGradient.setGradient(view: titleView, mainColor: UIColor.getHIITPrimaryOrange, secondColor: UIColor.getHIITAccentOrange)
        titleView.layer.shadowOpacity = 0.3
        titleView.layer.shadowOffset = CGSize(width: 0, height: 3)
        // Do any additional setup after loading the view.
        
        if ProfileController.sharedInstance.profile.firstLogin {
            progressView.isHidden = false
            preferenceLabel.isHidden = false
            backButton.isHidden = true
            doneButton.isHidden = false
        } else {
            progressView.isHidden = true
            preferenceLabel.isHidden = true
            backButton.isHidden = false
            doneButton.isHidden = true
        }
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        ProfileController.sharedInstance.profile.firstLogin = false
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
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
