//
//  NetWorkManager.swift
//  APIStoryboard
//
//  Created by user on 13.04.2021.
//

import Foundation

//поиск

class NetWorkManager {
    //создаем синглтон
    static let shared: NetWorkManager = NetWorkManager()
    var username: String?
    private init() {}
    func getWeather(city: String, result: @escaping((OfferModel?) -> ())){
        var urlComponents = URLComponents()//компоненты для запроса
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        urlComponents.queryItems = [URLQueryItem(name: "q", value: city), URLQueryItem(name: "appid", value: "a1cbc21b01177bf77a31510228bf644f")]
        
        var request = URLRequest(url: urlComponents.url!) //запрос
        request.httpMethod = "GET"
        
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { (data, response, error) in
            if error == nil{
                let decoder = JSONDecoder()
                var decoderOfferModel: OfferModel?
                
                if data != nil{
                    decoderOfferModel = try? decoder.decode(OfferModel.self, from: data!)
                }
                result(decoderOfferModel)
            }else{
                print(error as Any)
            }
        }.resume()
        
    }
}
