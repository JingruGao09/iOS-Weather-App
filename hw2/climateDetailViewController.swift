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
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var degLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    var cityName: String = ""
    //var climateImage: UIImage = UIImage()
    var climateDetail: UIImage = UIImage()
    var cityTemperature: String = ""
    var climateDescription: String = ""
    var humidityDescription: String = ""
    var tempMinDescription: String = ""
    var tempMaxDescription: String = ""
    var windDescription: String = "Wind"
    var speedDescription: String = ""
    var degDescription: String = ""
    var sunriseDescription: String = ""
    var sunsetDescription: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.climateDetailLabel.text = cityName
        self.climateDetailImage.image = climateDetail
        self.temperatureLabel.text = cityTemperature
        self.climateDescriptionLabel.text = climateDescription
        self.humidityLabel.text = humidityDescription
        self.tempMinLabel.text = tempMinDescription
        self.tempMaxLabel.text = tempMaxDescription
        self.windLabel.text = windDescription
        self.speedLabel.text = speedDescription
        self.degLabel.text = degDescription
        self.sunriseLabel.text = sunriseDescription
        self.sunsetLabel.text = sunsetDescription
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
