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
    @IBOutlet weak var ageTextField: PasteDisabledTextField!
    @IBOutlet weak var weightTextField: PasteDisabledTextField!
    
    let profile = ProfileController.sharedInstance.profile
    let genderPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupPickerView()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func screenTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
        genderTextField.endEditing(true)
        ageTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        
    }

    func setupViews() {
        healthKitSwitch.isOn = profile.healthKitIsOn
        nameTextField.delegate = self
        genderTextField.delegate = self
        ageTextField.delegate = self
        weightTextField.delegate = self
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
            profile.gender = 0
        case 2:
            genderTextField.text = "Female"
            profile.gender = 1
        default:
            genderTextField.text = "Error"
        }
    }
}

extension AboutMeViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                return true
            }
        }
        guard let text = textField.text else {return false}
        if textField == ageTextField || textField == weightTextField {
            return text.count < 5
        }
        return text.count < 9
    }
}
