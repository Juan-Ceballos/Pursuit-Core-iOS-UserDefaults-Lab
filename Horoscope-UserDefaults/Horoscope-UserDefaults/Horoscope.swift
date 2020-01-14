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
    let credit: String
    let date: String
    let horoscope: String
    let meta: meteWrapper
}

struct meteWrapper: Decodable   {
    let mood: String
    let keywords: String
    let intensity: String
}
