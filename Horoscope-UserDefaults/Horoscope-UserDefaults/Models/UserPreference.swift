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

enum HoroscopeText  {
    case empty(String)
    case currentHoroscope(String)
}

enum Name   {
    case empty(String)
    case userName(String)
}

struct UserPreferenceKey    {
    static let sunSign = "Sun Sign"
    static let horoscope = "Horoscope"
    static let name = "Name"
}


class UserPreference {
    
    private init()  {}
    private let standard = UserDefaults.standard
    static let shared = UserPreference()
    
    func updateSunSign(with sunsign: SunSign)  {
        standard.set(sunsign.rawValue, forKey: UserPreferenceKey.sunSign)
    }
    
    
    func getSunSign() -> SunSign?   {
        guard let sunSign = UserDefaults.standard.object(forKey: UserPreferenceKey.sunSign) as? String
            else    {
                return nil
        }
        
        return SunSign(rawValue: sunSign)
    }
    
    func updateHoroscope(with horoscope: String) {
        standard.set(horoscope, forKey: UserPreferenceKey.horoscope)
    }
    
    func getHoroscope() -> String?   {
        guard let horoscope = UserDefaults.standard.object(forKey: UserPreferenceKey.horoscope) as? String
            else    {
                return nil
        }
        return horoscope
    }
    
    func updateName(with name: String)   {
        standard.set(name, forKey: UserPreferenceKey.name)
    }
    
    func getName()  -> String?    {
        guard let enteredName = standard.object(forKey: UserPreferenceKey.name) as? String
            else    {
                return nil
        }
        return enteredName
    }
    
}
