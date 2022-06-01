//
//  AddWeatherViewModel.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import Foundation
class AddWeatherViewModel
{
    func addWeather(for city:String, completion:@escaping(WeatherViewModel) -> Void)
    {
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
      
        let weatherResponse  = Resourse<WeatherResponse>(url:weatherURL){
            data in
            let weatherResponse  = try? JSONDecoder().decode(WeatherResponse.self, from: data)
           
            return weatherResponse
        }
        WebService().load(resourse: weatherResponse)
        { (result) in
            if let weatherResourse  = result
            {
                let vm = WeatherViewModel(weather:weatherResourse)
               
                completion(vm)
            }
        }
    }
}
