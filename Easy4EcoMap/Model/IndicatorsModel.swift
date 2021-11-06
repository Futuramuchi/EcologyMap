//
//  IndicatorsModel.swift
//  Easy4EcoMap
//
//  Created by Даня on 06.11.2021.
//

import Foundation


struct IndicatorsModel: Identifiable, Hashable, Codable{
    var id = UUID().uuidString
    var name, value: String
}
