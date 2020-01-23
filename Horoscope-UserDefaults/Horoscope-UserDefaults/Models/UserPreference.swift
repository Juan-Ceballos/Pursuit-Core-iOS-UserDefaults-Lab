//
//  UserInfo.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

enum SunSign: String, CaseIterable    {
    
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
    
    static let allCases = [empty, gemini, taurus, aries, cancer, saggatarius, pisces, virgo, leo, capricorn, libra, aquarius, scorpio]
}



struct UserPreferenceKey    {
    static let sunSign = "Sun Sign"
}

class UserPreference {
    
    private init()  {}
    private let standard = UserDefaults.standard
    static let shared = UserPreference()
    
    // take ie. .libra and store the string Libra in user defaults
    func updateHoroscope(with sunsign: SunSign)  {
        standard.set(sunsign.rawValue, forKey: UserPreferenceKey.sunSign)
    }
    
    
    func getHoroscope() -> SunSign?   {
        guard let horoscope = UserDefaults.standard.object(forKey: UserPreferenceKey.sunSign) as? String
            else    {
                return nil
        }
        
        return SunSign(rawValue: horoscope)
        
    }
    
}
