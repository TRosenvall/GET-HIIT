//
//  MainTabBarViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/15/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    static var finishedExercise = 0
    let defaultColor = UIColor(displayP3Red: 249, green: 249, blue: 249, alpha: 1)
    let selectedColor = UIColor(displayP3Red: 199, green: 199, blue: 204, alpha: 1)
    
    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTabBar.tintColor = defaultColor
        
        setTabBarItems()
    }
    
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 120
        tabFrame.origin.y = self.view.frame.size.height - 120
        self.tabBar.frame = tabFrame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if MainTabBarViewController.finishedExercise == 1 {
            self.selectedIndex = 0
            MainTabBarViewController.finishedExercise = 0
        }
    }
    
    func setTabBarItems(){
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "UnselectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(named: "SelectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        myTabBarItem1.title = "Dashboard"
        myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "UnselectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = UIImage(named: "SelectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        myTabBarItem2.title = "My Plan"
        myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "UnselectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.selectedImage = UIImage(named: "SelectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        myTabBarItem3.title = "Workout"
        myTabBarItem3.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "UnselectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.selectedImage = UIImage(named: "SelectedTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        myTabBarItem4.title = "Profile"
        myTabBarItem4.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
}
