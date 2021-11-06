//
//  IndicatorsAQIModel.swift
//  Easy4EcoMap
//
//  Created by Даня on 06.11.2021.
//

import Foundation

struct IndicatorsAQIModel: Identifiable, Hashable, Codable{
    var id = UUID().uuidString
    var name, value: String
}
