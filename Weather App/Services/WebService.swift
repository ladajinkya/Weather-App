//
//  WebService.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import Foundation
import UIKit
struct Resourse<T>
{
    let url:URL
    let parse: (Data) -> T?
}
final class WebService
{
    func load<T>(resourse : Resourse<T>, completion : @escaping(T?) -> ())
    {
        URLSession.shared.dataTask(with: resourse.url)
        {(data,response,error) in
            if let data = data{
                DispatchQueue.main.async {
                    completion(resourse.parse(data))
                }
               
            } else {completion (nil)}
            
        }.resume()
    }

}
