//
//  WeatherManager.swift
//  WeatherDemo
//
//  Created by Joko Priyono on 29/12/21.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(lat: CLLocationDegrees, long: CLLocationDegrees) async throws -> ResponseBody {
        let apiKey = "c9778a08b5bf87b4aa3402ceb7d93a90"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(apiKey)&units=metric") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

// MARK: - ResponseBody
struct ResponseBody: Codable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: Main
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var timezone, id: Int
    var name: String
    var cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    var all: Int
}

// MARK: - Coord
struct Coord: Codable {
    var lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    var temp, feels_like, temp_min, temp_max: Double
    var pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feels_like
        case temp_min
        case temp_max
        case pressure, humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    var id: Double
    var main, description, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case description
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    var speed, deg: Double
}
