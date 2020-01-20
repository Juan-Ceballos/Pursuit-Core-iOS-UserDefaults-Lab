//
//  UserInfo.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

class UserPreference {
    private init()  {}
    
    private let standard = UserDefaults.standard
    
    static let shared = UserPreference()
    
}
