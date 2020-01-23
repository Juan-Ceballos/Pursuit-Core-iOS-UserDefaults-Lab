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
    
    var horoscopes = SunSign.empty  {
        didSet  {
            sunSignLabel.text = horoscopes.rawValue
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
        if let currentHoroscope = UserPreference.shared.getHoroscope() {
            horoscopes = currentHoroscope
        }
    }
    
}
