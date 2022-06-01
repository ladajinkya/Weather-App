//
//  String+Extenions.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import Foundation
extension String
{
    func escaped()-> String
    {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
