//
//  climateTableViewController.swift
//  hw2
//
//  Created by Jingru Gao on 9/17/19.
//  Copyright © 2019 Jingru Gao. All rights reserved.
//

import UIKit



class climateTableViewController: UITableViewController {
    
    @IBOutlet weak var cityWeatherSearchBar: UISearchBar!
    var allCityWeathers = [cityWeatherResponse]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                //self.navigationItem.title =
            }
        }
    }
    
    
    var cellBackgroundColor: [String: UIColor] = [
        "01d": UIColor.blue,
        "01n": UIColor(red: 0, green: 0.2235, blue: 0.6078, alpha: 1.0),
        "02d": UIColor(red: 0, green: 0.6078, blue: 0.9569, alpha: 1.0),
        "02n": UIColor(red: 0, green: 0.4314, blue: 0.7373, alpha: 1.0),
        "03d": UIColor(red: 0, green: 0.6196, blue: 0.8863, alpha: 1.0),
        "03n": UIColor(red: 0, green: 0.2392, blue: 0.6275, alpha: 1.0),
        "04d": UIColor(red: 0.4, green: 0.8824, blue: 0.9765, alpha: 1.0),
        "04n": UIColor(red: 0.3686, green: 0.4196, blue: 0.6471, alpha: 1.0),
        "09d": UIColor(red: 0, green: 0.8667, blue: 0.7216, alpha: 1.0),
        "09n": UIColor(red: 0.3961, green: 0.502, blue: 0.698, alpha: 1.0),
        "10d": UIColor(red: 0.9882, green: 0.8706, blue: 0, alpha: 1.0),
        "10n": UIColor(red: 0.349, green: 0.5412, blue: 0.898, alpha: 1.0),
        "11d": UIColor(red: 0.7373, green: 0.7373, blue: 0.7373, alpha: 1.0),
        "11n": UIColor(red: 0.3137, green: 0.5451, blue: 0.8078, alpha: 1.0),
        "13d": UIColor(red: 0.9569, green: 0.9569, blue: 0.9569, alpha: 1.0),
        "13n": UIColor(red: 0.2784, green: 0.4863, blue: 0.9686, alpha: 1.0),
        "50d": UIColor(red: 0.5804, green: 0.7647, blue: 0.8275, alpha: 1.0),
        "50n": UIColor(red: 0, green: 0.8784, blue: 0.7765, alpha: 1.0),
    ]
    
    var cellDetailWeatherBackgroundImage: [String: String] = [
        "01d": "sunnyDay",
        "01n": "sunnyNight",
        "02d": "cloudyDay",
        "02n": "cloudyNight",
        "03d": "cloudsDay",
        "03n": "cloudsNight",
        "04d": "cloudsDay",
        "04n": "cloudsNight",
        "09d": "rainDay",
        "09n": "rainNight",
        "10d": "sunnyRainDay",
        "10n": "sunnyRainNight",
        "11d": "stormDay",
        "11n": "stormNight",
        "13d": "snowDay",
        "13n": "snowNight",
        "50d": "fogDay",
        "50n": "fogNight"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        self.tableView.allowsSelectionDuringEditing = true
        //cityWeatherSearchBar.delegate = self
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        let cities = ["London,uk", "Durham,us","Shanghai,cn","Tokyo,jp","Cary,us"]
        for city in cities {
            getWeatherList(city: city)
        }
    }
    
    func getWeatherList(city: String) {
        let weatherRequest = WeatherRequest(countryName:city)
        weatherRequest.getWeather{[weak self] result in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let cityWeather):
                        self?.allCityWeathers.append(cityWeather)
                    }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.allCityWeathers.count
    }

    func calculateKelvinToFahrenheit(kelvin: Double) -> String {
        let fahrenheit = (kelvin - 273.15) * 9 / 5 + 32
        let temp = String(format: "%.f", fahrenheit)
        return temp
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myClimateCell", for: indexPath) as! climateTableViewCell
        
        let cityClimate = self.allCityWeathers[indexPath.row]
        for city in cityClimate.weather {
            print(city.main)
            print(city.description)
        }
        
        cell.cityLable?.text = cityClimate.name
        cell.temperatureLabel?.text = calculateKelvinToFahrenheit(kelvin: cityClimate.main.temp) + "º"
        cell.countryLabel?.text = cityClimate.sys.country
        cell.climateImageView?.image = UIImage(named: cityClimate.weather.first!.icon)
        cell.backgroundColor = cellBackgroundColor[cityClimate.weather.first!.icon]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "City Weather"
    }

    /*
    func getAllData(cityName: String, countryAb: String) {
        
    
        let mySession = URLSession(configuration: URLSessionConfiguration.default)

        // run in background
        let url = URL(string: "https://weatherbit-v1-mashape.p.rapidapi.com/current?lang=en&lon=%3Crequired%3E&lat=%3Crequired%3E")!
        
        print(url)

        let task = mySession.dataTask(with: url) {data, responds, error in
            guard error == nil else {
                print("error: \(error!)")
                return
            }
            guard let content = data else {
                print("No data")
                return
            }

            //Decode the resulting JSON
            let decoder = JSONDecoder()
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    if let daily = json["weather"] as? [[String: Any]] {
                        for dailyW in daily {
                            if let weatherObj = try? cityWeather(json: dailyW){
                                //let obj = try decoder.decode(weatherObj.self, from: weatherObj)
                                self.allCityWeathers.append(weatherObj)
                            }
                        }
                    }
                }
                // decode the json int to array
                self.allCityWeathers = try decoder.decode([cityWeather].self, from: data!)

                print("Got the data with total of \(self.allCityWeathers.count) items")
                
                
                // force reload the tableview (now that we have data)
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }catch {
                print("JSON Decode error")
            }
        }
        task.resume()
    }
 */
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allCityWeathers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//
//    }
//    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false;
//    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let cityWeatherToMove = self.allCityWeathers[fromIndexPath.row]
        allCityWeathers.remove(at: fromIndexPath.row)
        allCityWeathers.insert(cityWeatherToMove, at: to.row)
    }
    

    
    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let destVC = segue.destination as! climateDetailViewController
        let myRow = tableView!.indexPathForSelectedRow
        let currentCityWeatherObj = self.allCityWeathers[myRow!.row]
        let currentWeather = tableView!.cellForRow(at: myRow!) as! climateTableViewCell
        
        let climateLabelName: String? = currentWeather.cityLable!.text!
       
        let climateDetailImagePic: UIImage? = UIImage(named: cellDetailWeatherBackgroundImage[currentCityWeatherObj.weather.first!.icon]!)
        let climateDescriptionName: String? = currentCityWeatherObj.weather.first!.description
        let climateTemperatureName: String? = calculateKelvinToFahrenheit(kelvin: currentCityWeatherObj.main.temp) + "º"
        let cityHumidity = currentCityWeatherObj.main.humidity
        let cityTempMin = currentCityWeatherObj.main.temp_min
        let cityTempMax = currentCityWeatherObj.main.temp_max
        let cityWindSpeed = currentCityWeatherObj.wind?.speed
        let cityWindDeg = currentCityWeatherObj.wind?.deg
        let citySunrise = currentCityWeatherObj.sys.sunrise
        let citySunset = currentCityWeatherObj.sys.sunset

        destVC.cityName = climateLabelName!
        destVC.climateDetail = climateDetailImagePic!
        destVC.climateDescription = firstLetterUpperCase(toConvert: climateDescriptionName!)
        //destVC.climateDescription = climateDescriptionName!
        destVC.cityTemperature = climateTemperatureName!
        destVC.humidityDescription = "Humidity: " + String(cityHumidity)
        destVC.tempMinDescription = "Min Temperature: " + String(cityTempMin) + "º"
        destVC.tempMaxDescription = "Max Temperature: " + String(cityTempMax) + "º"
        destVC.speedDescription = "Speed: " + String(format: "%.f", cityWindSpeed!)
        destVC.degDescription = "Deg: " + String(format: "%.f", cityWindDeg!)
        destVC.sunriseDescription = "Sunrise: " + String(citySunrise)
        destVC.sunsetDescription = "Sunset: " + String(citySunset)
        
    }
    
    func firstLetterUpperCase(toConvert: String) -> String {
        print("here")
        let arr = toConvert.components(separatedBy: " ")
        print(arr)
        //split(separator: " ")
        var ans = ""
        for cha in arr {
            //ans += cha
            let range = cha.index(cha.startIndex, offsetBy: 1)..<cha.endIndex

            // Access the substring.
            let substring = cha[range]
            ans += (cha.first?.uppercased())! + substring + " "
        }
        ans.dropLast()
        print("Drop here: ")
        print(arr)
        return ans
    }
}

//extension climateTableViewController: UISearchBarDelegate{
//    func cityWeatherSearchButtonClicked(_ cityWeatherSearchBar: UISearchBar) {
//        guard let cityWeatherSearchBarText = cityWeatherSearchBar.text else {return}
//        let weatherRequest = WeatherRequest(countryName: cityWeatherSearchBarText)
//        weatherRequest.getWeather{[weak self] result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let cityWeather):
//                self?.allCityWeathers.append(cityWeather)
//            }
//
//        }
//    }
//}
