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
        if let currentSunSign = UserPreference.shared.getSunSign() {
            sunSigns = currentSunSign
        }
        else    {
            sunSignLabel.text = ""
        }
        
        if let currentHoroscope = UserPreference.shared.getHoroscope()  {
            horoscopes = currentHoroscope
        }
        else    {
            textView.text = "Please Enter User Info"
        }
        
        if let currentName = UserPreference.shared.getName()    {
            names = currentName
        }
        else    {
            userNameLabel.text = ""
        }
        
    }
    
}
