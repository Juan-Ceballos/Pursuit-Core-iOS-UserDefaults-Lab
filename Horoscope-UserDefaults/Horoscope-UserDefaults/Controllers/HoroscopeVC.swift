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
    
    var horoscope: Horoscope?
    let emptyHoroscope = Horoscope(sunsign: "", date: "", horoscope: "Please Enter User Info")
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateUI()
    }
    
    func updateUI() {
        //populate textview horoscope and sign
        if let currentSunSign = UserPreference.shared.getSunSign() {
            sunSigns = currentSunSign
        }
        
        if let currentHoroscope = UserPreference.shared.getHoroscope()  {
            horoscopes = currentHoroscope
        }
            
    }
}
