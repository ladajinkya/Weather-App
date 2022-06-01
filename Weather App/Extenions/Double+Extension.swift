//
//  Double+Extension.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import Foundation
extension Double
{
    func formatAsDegree()-> String
    {
        return String(format:"%.0f",self)
    }
}
