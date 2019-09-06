//
//  InterfaceController.swift
//  Get-HIITWatch Extension
//
//  Created by Timothy Rosenvall on 9/4/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var heartRateLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: NSNotification.Name("sendHeartRate"), object: nil)
    }
    
    @objc func updateLabel(notification: NSNotification) {
        let heartRate = notification.object
        heartRateLabel.setText("\(heartRate)")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
