//
//  SettingsViewModel.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//
import Foundation
enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
                case .celsius:
                    return "Celcius"
                case .fahrenheit:
                    return "Fahrenheit"
            }
        }
    }
    
}

class SettingsViewModel {
    
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
           
            var unitValue = ""
            if let value = UserDefaults.standard.value(forKey: "unit") as? String {
                unitValue = value
                
            }
            print("unitvalue = \(unitValue)")
            return Unit(rawValue: unitValue)!
            
           
        }
        set {
           
            UserDefaults.standard.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}

