//
//  SkeletonProfileViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/18/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class SkeletonProfileViewController: UIViewController {

    @IBOutlet weak var optionsMenuImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsMenuImageView.isHidden = true
    }
}
