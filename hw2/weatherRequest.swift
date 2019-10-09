//
//  weatherRequest.swift
//  hw2
//
//  Created by Jingru Gao on 10/4/19.
//  Copyright © 2019 Jingru Gao. All rights reserved.
//

import Foundation

enum cityWeatherError: Error {
    case noDataAvailabel
    case canNotProcessData
}

struct WeatherRequest {
    let resourceURL: URL
    let API_KEY = "30746e13e3d13d28676d3a654d31be02"
    
    init(countryName:String) {
        print(countryName)
        let resourceString = "https://api.openweathermap.org/data/2.5/weather?q=\(countryName)&appid=\(API_KEY)"
        //"https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=30746e13e3d13d28676d3a654d31be02" 
             
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func getWeather(completion: @escaping (Result<cityWeatherResponse, cityWeatherError>)-> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, responses, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailabel))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(cityWeatherResponse.self, from: jsonData)
                //print(weatherResponse.name)
                completion(.success(weatherResponse))
            }
            catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
