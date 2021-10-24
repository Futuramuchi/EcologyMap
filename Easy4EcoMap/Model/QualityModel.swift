//
//  QualityModel.swift
//  Easy4EcoMap
//
//  Created by danyaq on 07.10.2021.
//

import Foundation


struct QualityModel: Hashable, Identifiable{
    let id = UUID().uuidString
    let value: Double
    let name: String
}

var qualityModel = [QualityModel(value: Double(HTMLParser().no2) ?? 0, name: "NO2"),QualityModel(value: Double(HTMLParser().no) ?? 0, name: "NO"),QualityModel(value: Double(HTMLParser().co) ?? 0, name: "CO"), QualityModel(value: Double(HTMLParser().pm10) ?? 0, name: "PM10")]
