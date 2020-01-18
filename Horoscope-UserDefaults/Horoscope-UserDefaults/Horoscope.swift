//
//  Horoscope.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/13/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

struct Horoscope: Decodable {
    let sunsign: String
    let date: String
    let horoscope: String
}

