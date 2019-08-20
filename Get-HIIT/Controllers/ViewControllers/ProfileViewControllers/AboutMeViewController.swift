//
//  AboutMeViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/20/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var healthKitSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var weightTextField: PasteDisabledTextField!
    
    var profile: Profile?
    let genderPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupPickerView()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
        if let profile = profile {
            healthKitSwitch.isOn = profile.healthKitIsOn
        } else {
            healthKitSwitch.isOn = false
        }
        nameTextField.layer.borderWidth = 0
        genderTextField.layer.borderWidth = 0
        weightTextField.layer.borderWidth = 0
    }
    
    func setupPickerView() {
        self.genderPicker.delegate = self as UIPickerViewDelegate
        self.genderPicker.dataSource = self as UIPickerViewDataSource
        genderTextField.inputView = genderPicker
    }
    
    
}

extension AboutMeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Select Your Gender"
        case 1:
            return "Male"
        case 2:
            return "Female"
        default:
            return "Error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            genderTextField.text = genderTextField.text
        case 1:
            genderTextField.text = "Male"
            self.view.endEditing(true)
        case 2:
            genderTextField.text = "Female"
            self.view.endEditing(true)
        default:
            genderTextField.text = "Error"
        }
    }
}
