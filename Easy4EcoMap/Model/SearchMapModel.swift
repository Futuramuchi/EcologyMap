//
//  SearchMapModel.swift
//  Easy4EcoMap
//
//  Created by Даня on 06.10.2021.
//

import Foundation
import MapKit


struct SearchMapModel: Identifiable{
    var id = UUID().uuidString
    var place: CLPlacemark
}
