//
//  HoroscopeAPI.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/13/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import NetworkHelper

class HoroscopeAPI  {
    static func fetchHoroscope(horoscope: String, completion: @escaping (Result<Horoscope, AppError>) -> ())    {
        let endpointURL = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today/"
        
        guard let url = URL(string: endpointURL)
            else    {
                completion(.failure(.badURL(endpointURL)))
                return
        }
        
        let request = URLRequest(url: url)
            
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do  {
                    let horo = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(horo))
                }
                catch   {
                    completion(.failure(.decodingError(error)))
            }
                
                }
            }
        }
    }

