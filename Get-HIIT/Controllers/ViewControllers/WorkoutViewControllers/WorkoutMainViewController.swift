//
//  WorkoutMainViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class WorkoutMainViewController: UIViewController {

    @IBOutlet weak var currentWorkoutTableView: UITableView!
    @IBOutlet weak var tempWorkoutImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWorkoutTableView.frame.size.height = 4*tempWorkoutImageView.frame.height/5
        currentWorkoutTableView.center.y = tempWorkoutImageView.center.y + 10
    }
}

extension WorkoutMainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currentWorkoutCell", for: indexPath) as? WorkoutTableViewCell else {return UITableViewCell()}
        cell.frame.size.height = currentWorkoutTableView.frame.height/4
        cell.exerciseView.frame.size.height = 2*currentWorkoutTableView.frame.height/3
        cell.restView.frame.size.height = currentWorkoutTableView.frame.height/3
        return cell
    }
}
