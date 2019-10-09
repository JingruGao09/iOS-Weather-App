//
//  File.swift
//  hw2
//
//  Created by Jingru Gao on 10/4/19.
//  Copyright © 2019 Jingru Gao. All rights reserved.
//

import Foundation

struct cityWeatherResponse: Codable {
    var name: String
    var weather:[cityWeatherDetail]
    var timezone: Int
    var coord: cityCoord
    var sys: citySys
    var main: cityMain
    var base: String
    var visibility: Int?
    var dt: Int
    var cod: Int
    //var rain: cityRain?
    var clouds: cityClouds?
    var wind: cityWind?
}


struct cityWeatherDetail: Codable {
    var id:Int
    var main:String
    var description:String
    var icon:String
}
struct cityCoord: Codable {
    var lon:Double
    var lat:Double
}

struct citySys: Codable {
    var type: Int
    var id: Int
    //var message: Double?
    var country: String
    var sunrise: Int
    var sunset: Int
}
struct cityMain: Codable {
    var temp:Double
    var humidity:Int
    var pressure:Int
    var temp_min:Double
    var temp_max:Double
}
struct cityWind: Codable {
    var speed: Double
    var deg: Int
}
//struct cityRain:Codable {
//    var hourly:Double
//}
struct cityClouds:Codable {
    var all:Int
}
