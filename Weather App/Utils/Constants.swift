//
//  Constants.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import Foundation
struct Constants
{
    struct Urls {
       
        static func urlForWeatherByCity(city:String) -> URL
        {
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            return URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=3261d3e25cf4a26ef2a555833e833457&units=\(unit)")!
        }
    }
}
