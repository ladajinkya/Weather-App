//
//  WeatherListTableViewController.swift
//  Weather App
//
//  Created by Ajinkya on 27/05/22.
//

import UIKit
import CoreData

class WeatherListTableViewController: UITableViewController {
    private var lastUnitSelection: Unit!
    private var weatherListViewModel = WeatherListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
                    let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
//            navigationController?.navigationBar.
                    navigationController?.navigationBar.standardAppearance = barAppearance
                    navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        } else {
                   
        }
    
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return weatherListViewModel.numberOfRows(section)
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
         let weatherVM = weatherListViewModel.modelAt(indexPath.row)
         cell.configure(weatherVM)
        
     return cell
     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController"
        {
           prepareSegueForAddWeatherCityViewController(segue: segue)
        }
        else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
           
           guard let nav = segue.destination as? UINavigationController else {
               fatalError("NavigationController not found")
           }
           
           guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
               fatalError("SettingsTableViewController not found")
           }
           
           settingsTVC.delegate = self
           
       }
    func prepareSegueForAddWeatherCityViewController(segue:UIStoryboardSegue)
    {
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("AddWeatherCityViewController not found")
            return
            
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        addWeatherCityVC.delegate = self
    }
}
extension WeatherListTableViewController : AddWeatherDelegate
{
    func addWeatherDidSave(vm: WeatherViewModel) {
       
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    
}
extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
       // UserDefaults.standard.set("CelSius", forKey: "unit")
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
}
