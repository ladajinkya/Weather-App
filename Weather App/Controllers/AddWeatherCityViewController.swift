//
//  AddWeatherCityViewController.swift
//  Weather App
//
//  Created by Ajinkya on 27/05/22.
//

import UIKit
protocol AddWeatherDelegate
{
    func addWeatherDidSave(vm:WeatherViewModel)
}
class AddWeatherCityViewController: UIViewController {
   private var addWeatherVM = AddWeatherViewModel()
    private let APIKey = "3261d3e25cf4a26ef2a555833e833457"
    @IBOutlet weak var cityTextField: UITextField!
    var delegate: AddWeatherDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveAction(_ sender: UIButton) {
        guard let city = cityTextField.text else {return}
       
        addWeatherVM.addWeather(for: city){ (vm) in
            self.delegate?.addWeatherDidSave(vm: vm)
            self.dismiss(animated: true, completion: nil)
            
        }
        
       
    }
    
  
    
}
extension AddWeatherCityViewController:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
}
