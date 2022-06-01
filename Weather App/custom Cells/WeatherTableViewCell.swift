//
//  WeatherTableViewCell.swift
//  Weather App
//
//  Created by Ajinkya on 01/06/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var templabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(_ vm:WeatherViewModel)
    {
        self.cityLabel.text = vm.city
        self.templabel.text = "\(vm.temperature.formatAsDegree())°"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
