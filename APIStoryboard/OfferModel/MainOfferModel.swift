//
//  MainOfferModel.swift
//  APIStoryboard
//
//  Created by user on 14.04.2021.
//

import Foundation


class MainOfferModel: Codable {
    var temp: Float?
    var feelsLike: Float?
    var tempMin: Float?
    var tempMax: Float?
    var pressure: Int?
    var seaLevel: Int?
    var grndLevel: Int?
    var humidity: Int?
    var tempKf: Float?
}
