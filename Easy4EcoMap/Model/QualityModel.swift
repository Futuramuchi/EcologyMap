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


