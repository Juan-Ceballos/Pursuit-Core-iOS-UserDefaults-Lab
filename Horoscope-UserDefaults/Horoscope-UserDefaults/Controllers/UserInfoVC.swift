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
    @IBOutlet weak var sunSignLabel: UILabel!
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    var horoscope: Horoscope?
    let emptyHoroscope = Horoscope(sunsign: "", date: "", horoscope: "Please Enter User Info")
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.delegate = self
        updateUI()
    }
    
    func updateUI() {
        datePickerView.maximumDate = Date()
        nameLabel.text = "User Name: \(UserPreference.shared.getName() ?? "")"
        sunSignLabel.text = "Current Sign: \(UserPreference.shared.getSunSign()?.rawValue ?? "")"
        pickerView.selectRow(UserPreference.shared.getPickerRowPosition() ?? 0, inComponent: 0, animated: false)
        
        
        datePickerView.timeZone = .current
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        UserPreference.shared.updatePickerRowPosition(with: 0)
        UserPreference.shared.updateName(with: "")
        UserPreference.shared.updateSunSign(with: SunSign.empty)
        UserPreference.shared.updateHoroscope(with: emptyHoroscope.horoscope)
        
        nameLabel.text = "User Name: \(UserPreference.shared.getName() ?? "")"
        sunSignLabel.text = "Current Sign: \(UserPreference.shared.getSunSign()?.rawValue ?? "")"
        pickerView.selectRow(UserPreference.shared.getPickerRowPosition() ?? 0, inComponent: 0, animated: false)
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker)  {
        
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .none
        print(df.string(from: sender.date))
    }
    
    // 1) starting refactor to prompt for birthday using date picker
    // 2) don't have to consider year
    // 3) max date should be current date
    // _datePicker.maximumDate = [NSDate date];    // _datePicker is a outlet.
    // datePicker.maximumDate = Date()
    // 4) connect date with sunsign, see if could stick to persisting sunsign,
    // where is sunsign decided?
    // 5) store date?
    
}


extension UserInfoVC: UITextFieldDelegate   {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        UserPreference.shared.updateName(with: textField.text ?? "")
        nameLabel.text = "User Name: \(UserPreference.shared.getName() ?? "")"
        textField.text = ""
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 9
    }
}

extension UserInfoVC: UIPickerViewDataSource    {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let numberOfHoroscopesEnum = SunSign.allCases.count
        return numberOfHoroscopesEnum
    }
}

extension UserInfoVC: UIPickerViewDelegate  {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SunSign.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selected = pickerView.selectedRow(inComponent: 0)
        
        if selected != 0    {
            HoroscopeAPI.fetchHoroscope(horoscope: SunSign.allCases[selected].rawValue.lowercased()) { [weak self] (result) in
                switch result   {
                case .failure(let appError):
                    print(appError)
                case .success(let horoscope):
                    self?.horoscope = horoscope
                    UserPreference.shared.updateSunSign(with: SunSign.allCases[selected])
                    UserPreference.shared.updateHoroscope(with: horoscope.horoscope)
                    UserPreference.shared.updatePickerRowPosition(with: selected)
                    DispatchQueue.main.async {
                        self?.sunSignLabel.text = "Current Sign: \(UserPreference.shared.getSunSign()?.rawValue ?? "")"
                    }
                }
            }
        }
        else    {
            horoscope = emptyHoroscope
            UserPreference.shared.updateSunSign(with: SunSign.empty)
            UserPreference.shared.updateHoroscope(with: emptyHoroscope.horoscope)
            sunSignLabel.text = "Current Sign: \(UserPreference.shared.getSunSign()?.rawValue ?? "")"
        }
        
    }
    
}


