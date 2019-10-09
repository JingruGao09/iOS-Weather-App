//
//  climateDetailViewController.swift
//  hw2
//
//  Created by Jingru Gao on 9/19/19.
//  Copyright © 2019 Jingru Gao. All rights reserved.
//

import UIKit

class climateDetailViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var climateDescriptionLabel: UILabel!
    @IBOutlet weak var climateDetailLabel: UILabel!
    
    @IBOutlet weak var climateDetailImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var degLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    @IBOutlet weak var climateSignImage: UIImageView!
    
    
    @IBOutlet weak var humidityContextLabel: UILabel!
    
    @IBOutlet weak var tminContextLabel: UILabel!
    
    @IBOutlet weak var tmaxContextLabel: UILabel!
    
    @IBOutlet weak var speedContextLabel: UILabel!
    @IBOutlet weak var degContextLabel: UILabel!
    @IBOutlet weak var sunriseContextLabel: UILabel!
    @IBOutlet weak var sunsetContextLabel: UILabel!
    
    
    var cityName: String = ""
    //var climateImage: UIImage = UIImage()
    var climateDetail: UIImage = UIImage()
    var cityTemperature: String = ""
    var climateDescription: String = ""
    var humidity: String = "Humidity"
    var humidityDescription: String = ""
    var tempMin: String = "Min Temperature"
    var tempMinDescription: String = ""
    var tempMax: String = "Max Temperature"
    var tempMaxDescription: String = ""
    var windDescription: String = "Wind"
    var speed: String = "Speed"
    var speedDescription: String = ""
    var deg: String = "Degree"
    var degDescription: String = ""
    var sunrise: String = "Sunrise"
    var sunriseDescription: String = ""
    var sunset: String = "Sunset"
    var sunsetDescription: String = ""
    var todayDate: String = ""
    var climateSign: UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.climateDetailLabel.text = cityName
        self.climateDetailImage.image = climateDetail
        self.temperatureLabel.text = cityTemperature
        self.climateDescriptionLabel.text = climateDescription
    
        self.humidityLabel.text = humidity
        self.humidityContextLabel.text = humidityDescription
        self.tempMinLabel.text = tempMin
        self.tminContextLabel.text = tempMinDescription
        self.tempMaxLabel.text = tempMax
        self.tmaxContextLabel.text = tempMaxDescription
        self.windLabel.text = windDescription
        self.speedLabel.text = speed
        self.speedContextLabel.text = speedDescription
        self.degLabel.text = deg
        self.degContextLabel.text = degDescription
        self.sunriseLabel.text = sunrise
        self.sunriseContextLabel.text = sunriseDescription
        self.sunsetLabel.text = sunset
        self.sunsetContextLabel.text = sunsetDescription
        self.dateLabel.text = todayDate
        self.climateSignImage.image = climateSign
        //self.climateDetailImage.backgroundColor = .black
        //climateImage
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
