//
//  OfferModel.swift
//  APIStoryboard
//
//  Created by user on 13.04.2021.
//

import Foundation

class OfferModel: Codable {
    var cod: String?
    var message: Float?
    var cnt: Float?
    //объект
    var list: [ListOfferModel]?
    var city: [CityModel]?
}
