//
//  Service.swift
//  Aplicativo Do Tempo
//
//  Created by Matheus S. C. on 16/02/24.
//

import Foundation

struct City {
    let name: String
    let country: String
}

class Service {
    private let baseURL: String = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey: String = "09360f3ecca68ba62027471bbe04d4e3"
    private let session = URLSession.shared
    
    
    
    func fetchData(city: City, _ completion: @escaping(ForecastResponse?) -> Void){//Função Assincrona
        let urlString = "\(baseURL)?q=\(city.name),\(city.country)&APPID=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {return}//se caso a URL exisir segue para a próxima linha senão return
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data else {
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            }catch{
                print(error)
                completion(nil)
            }
        }
        
        task.resume() //Executa a task
    }
}


import Foundation

// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let dt: Int
    let main: Main
    let wind: Wind
    let weather: [Weather]
}

// MARK: - Main
struct Main: Codable {
    let temp,tempMin, tempMax: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
