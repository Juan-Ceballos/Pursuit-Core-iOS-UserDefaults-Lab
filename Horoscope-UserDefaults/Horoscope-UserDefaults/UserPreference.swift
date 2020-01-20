//
//  UserInfo.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

enum SunSign: String    {
    case empty = ""
    case gemini = "Gemini"
    case taurus = "Taurus"
    case aries = "Aries"
    case cancer = "Cancer"
    case saggatarius = "Saggatarius"
    case pisces = "Pisces"
    case virgo = "Virgo"
    case leo = "Leo"
    case capricorn = "Capricorn"
    case libra = "Libra"
    case aquarius = "Aquarius"
    case scorpio = "Scorpio"
}

struct UserPreferenceKey    {
    static let sunSign = "Sun Sign"
}

class UserPreference {
    
    private init()  {}
    private let standard = UserDefaults.standard
    static let shared = UserPreference()
    
    func updateHoroscope(with sunsign: String)  {
        standard.set(sunsign, forKey: UserPreferenceKey.sunSign)
    }
    
    func getHoroscope() -> SunSign?   {
        guard let horoscope = UserDefaults.standard.object(forKey: UserPreferenceKey.sunSign) as? String
            else    {
                return nil
        }
        
        return SunSign(rawValue: horoscope)
        
    }
    
}
