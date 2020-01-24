//
//  HoroscopeVC.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class HoroscopeVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sunSignLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var sunSigns = SunSign.empty  {
        didSet  {
            sunSignLabel.text = sunSigns.rawValue
            UserPreference.shared.updateSunSign(with: sunSigns)
        }
    }
    
    var horoscopes = "Please Enter User Info"   {
        didSet  {
            textView.text = horoscopes
            UserPreference.shared.updateHoroscope(with: horoscopes)
        }
    }
    
    var names = ""  {
        didSet  {
            userNameLabel.text = names
            UserPreference.shared.updateName(with: names)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateUI()
    }
    
    func updateUI() {
        if let currentSunSign = UserPreference.shared.getSunSign(),
            let currentHoroscope = UserPreference.shared.getHoroscope(),
            let currentName = UserPreference.shared.getName()   {
            
            if currentName == "" || currentHoroscope == "" || currentSunSign.rawValue == ""  {
                textView.text = "Please Enter User Info"
                userNameLabel.text = ""
                sunSignLabel.text = ""
            }
            else    {
                sunSigns = currentSunSign
                horoscopes = currentHoroscope
                names = currentName
            }
            
        }
        
        else    {
            textView.text = "Please Enter User Info"
            userNameLabel.text = ""
            sunSignLabel.text = ""
        }
        
    }
    
}
