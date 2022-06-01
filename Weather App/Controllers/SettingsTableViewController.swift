//
//  SettingsTableViewController.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import UIKit
protocol SettingsDelegate {
    func settingsDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
private var settingsViewModel = SettingsViewModel()
    var delegate: SettingsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
                    let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            navigationController?.navigationBar.prefersLargeTitles = true
                    navigationController?.navigationBar.standardAppearance = barAppearance
                    navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        } else {
                   
        }
       // UserDefaults.standard.set("Celsius", forKey: "unit")
       
    }

    // MARK: - Table view data source

    @IBAction func DonePressed(_ sender: UIBarButtonItem) {
        if let delegate = self.delegate {
            delegate.settingsDone(vm: settingsViewModel)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
        
    }
}
