//
//  WeatherModel.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import Foundation
struct Weather:Decodable
{
    let temp:Double
    let humidity:Double
    
}
struct WeatherResponse:Decodable
{
    let main:Weather
    let name:String
}
