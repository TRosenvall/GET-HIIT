//
//  ViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/14/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appSkeletonStoryBoard = UIStoryboard(name: "AppSkeleton", bundle: nil)
        let appSkeleton = appSkeletonStoryBoard.instantiateInitialViewController()
        present(appSkeleton!, animated: false, completion: nil)
    }
}

