//
//  ViewController.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/13/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let horoscopeOptions = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Capricorn", "Saggatarius", "Aquarius", "Pisces", "Virgo", "Libra", "Scorpio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.delegate = self
    }
    
}

extension UserInfoVC: UITextFieldDelegate   {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        nameLabel.text = "User Name: \(textField.text ?? "")"
            textField.text = ""
        return true
    }
}

//func selectedRow(inComponent: Int) -> Int
//Returns the index of the selected row in a given component.

//func pickerView(UIPickerView, didSelectRow: Int, inComponent: Int)
//Called by the picker view when the user selects a row in a component.

extension UserInfoVC: UIPickerViewDataSource    {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let numberOfHoroscopes = horoscopeOptions.count
        return numberOfHoroscopes
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
}

extension UserInfoVC: UIPickerViewDelegate  {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 9
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return horoscopeOptions[row]
    }
}


