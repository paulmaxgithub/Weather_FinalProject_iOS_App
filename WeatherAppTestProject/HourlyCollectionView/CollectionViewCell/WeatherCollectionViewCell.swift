//
//  WeatherCollectionViewCell.swift
//  WeatherAppTestProject
//
//  Created by Paul Max on 8/31/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var timeLabel:        UILabel!
    @IBOutlet var tempLabel:        UILabel!
    @IBOutlet var iconImageView:    UIImageView!

    static let identifier = "WeatherCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeLabel.textColor = .white
        tempLabel.textColor = .white
        iconImageView.tintColor = .white
    }
    
    func configure(with model: HourlyWeatherEntry) {
        
        self.timeLabel.text = getHourFromTime(Date(timeIntervalSince1970: TimeInterval(model.time)))
        self.tempLabel.text = "\(convertToCelsius(model.temperature))°"
        self.iconImageView.contentMode = .scaleAspectFit
        
        let icon = model.icon.lowercased()
        if icon.contains("clear") {
            self.iconImageView.image = UIImage(systemName: "sun.max")
        } else if icon.contains("rain") {
            self.iconImageView.image = UIImage(systemName: "cloud.rain")
        } else {
            self.iconImageView.image = UIImage(systemName: "cloud")
        }
    }
    
    func getHourFromTime(_ date: Date?) -> String {
        
        guard let inputDate = date else { return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        return dateFormatter.string(from: inputDate)
    }
    
    func convertToCelsius(_ fahrenheit: Double) -> Int {
        return Int(5.0 / 9.0 * (Double(fahrenheit) - 32.0))
    }
}
