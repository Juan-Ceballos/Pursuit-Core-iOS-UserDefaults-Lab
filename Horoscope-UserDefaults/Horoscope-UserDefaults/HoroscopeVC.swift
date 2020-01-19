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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        guard let currentHoroscope = horoscope
            else    {
                fatalError()
        }
        
        textView.text = currentHoroscope.horoscope
        sunSignLabel.text = currentHoroscope.sunsign
    }
    
}
