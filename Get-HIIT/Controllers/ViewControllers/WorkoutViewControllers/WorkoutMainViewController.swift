//
//  WorkoutMainViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutMainViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var workoutSummaryView: UIView!
    @IBOutlet weak var currentWorkoutTableView: UITableView!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient(view: titleView, chooseTwo: true, primaryBlue: false, accentOrange: true, accentBlue: false)
        titleView.layer.shadowOpacity = 0.3
        titleView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        workoutSummaryView.layer.cornerRadius = workoutSummaryView.frame.width/2
        workoutSummaryView.layer.borderColor = UIColor.clear.cgColor
        workoutSummaryView.layer.borderWidth = 6
        gradientForWorkoutSummaryView()
        
        startButton.layer.cornerRadius = startButton.frame.height/4
        
        editButton.layer.cornerRadius = editButton.frame.height/4
        editButton.layer.borderWidth = 3
        editButton.layer.borderColor = UIColor.getHIITPrimaryOrange.cgColor
        editButton.layer.shadowOpacity = 0.3
        editButton.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func gradientForWorkoutSummaryView () {
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: .zero, size: self.workoutSummaryView.frame.size)
        gradient.colors = [UIColor.getHIITAccentOrange.cgColor, UIColor.getHIITPrimaryOrange.cgColor]
        
        let path = UIBezierPath(roundedRect: self.workoutSummaryView.bounds.insetBy(dx: self.workoutSummaryView.layer.borderWidth/2, dy: self.workoutSummaryView.layer.borderWidth/2), cornerRadius: self.workoutSummaryView.layer.cornerRadius)
        
        let shape = CAShapeLayer()
        shape.lineWidth = self.workoutSummaryView.layer.borderWidth
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        self.workoutSummaryView.layer.addSublayer(gradient)
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
        
        view.layer.addSublayer(gradient)
    }
}

extension WorkoutMainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currentWorkoutCell", for: indexPath) as? WorkoutTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
