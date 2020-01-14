//
//  HoroscopeTVC.swift
//  Horoscope-UserDefaults
//
//  Created by Juan Ceballos on 1/14/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class HoroscopeTVC: UITableViewController {
    
    @IBOutlet weak var horoscopeTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ViewController, let indexPath = horoscopeTV.indexPathForSelectedRow
            else    {
                fatalError()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row    {
        case 0:
            HoroscopeAPI.fetchHoroscope(horoscope: "aries") { (result) in
                switch result   {
                case .failure(let appError):
                    print(appError)
                case .success(let horo):
                    print(horo)
                }
            }
            default:
            print("default")
        }
    }

}
