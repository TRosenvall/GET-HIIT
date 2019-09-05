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
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var preferenceLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient(view: titleView, chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false)
        titleView.layer.shadowOpacity = 0.3
        titleView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        if ProfileController.sharedInstance.profile.firstLogin {
            backButton.isHidden = true
            doneButton.isHidden = false
            preferenceLabel.isHidden = false
            progressView.isHidden = false
        } else {
            backButton.isHidden = false
            doneButton.isHidden = true
            preferenceLabel.isHidden = true
            progressView.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        ProfileController.sharedInstance.profile.firstLogin = false
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
