//
//  StationModel.swift
//  Easy4EcoMap
//
//  Created by Даня on 24.10.2021.
//

import Foundation


struct StationModel: Identifiable, Hashable{
    var id = UUID().uuidString
    var title: String
    var latitude: Double
    var longitude: Double
}


var stations = [StationModel(title: "akademika-anoxina", latitude: 55.658163, longitude: 37.471434), StationModel(title: "butlerova", latitude: 55.649412, longitude: 37.535874), StationModel(title: "glebovskaya", latitude: 55.811801, longitude: 37.71249), StationModel(title: "koptevskij", latitude: 55.833222, longitude: 37.525158), StationModel(title: "marino", latitude: 55.652695, longitude: 37.751502), StationModel(title: "ostankino-0", latitude: 55.821154, longitude: 37.612592), StationModel(title: "proletarskij-prospekt", latitude: 55.635129, longitude: 37.658684), StationModel(title: "spiridonovka", latitude: 55.759354, longitude: 37.595584), StationModel(title: "turistskaya", latitude: 55.856324, longitude: 37.426628), StationModel(title: "shabolovka", latitude: 55.715698, longitude: 37.6052377)]
