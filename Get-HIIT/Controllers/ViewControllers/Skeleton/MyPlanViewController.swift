//
//  MyPlanViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/16/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class MyPlanViewController: UIViewController {

    @IBOutlet weak var upcomingImageView: UIImageView!
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var pastImageView: UIImageView!
    @IBOutlet weak var createNewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newImageView.isHidden = true
        pastImageView.isHidden = true
        createNewButton.isHidden = true
    }
    
    @IBAction func upcomingButtonTapped(_ sender: Any) {
        upcomingImageView.isHidden = false
        newImageView.isHidden = true
        pastImageView.isHidden = true
        createNewButton.isHidden = true
    }
    
    @IBAction func newButtonTapped(_ sender: Any) {
        upcomingImageView.isHidden = true
        newImageView.isHidden = false
        pastImageView.isHidden = true
        createNewButton.isHidden = false
    }
    
    @IBAction func pastButtonTapped(_ sender: Any) {
        upcomingImageView.isHidden = true
        newImageView.isHidden = true
        pastImageView.isHidden = false
        createNewButton.isHidden = true
    }
    
    @IBAction func createNewButtonTapped(_ sender: Any) {
        
        
    }
    
    
    
    
    
}
