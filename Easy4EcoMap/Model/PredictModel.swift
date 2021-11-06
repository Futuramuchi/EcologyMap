//
//  PredictModel.swift
//  Easy4EcoMap
//
//  Created by Даня on 06.11.2021.
//

import Foundation
import SwiftUI

struct PredictModel:Identifiable, Hashable{
    var id = UUID().uuidString
    var title: String
    var value: CGFloat
}

let testPredict = [PredictModel(title: "00:00", value: 12), PredictModel(title: "00:20", value: 18), PredictModel(title: "00:40", value: 24),PredictModel(title: "01:00", value: 42), PredictModel(title: "01:20", value: 36),PredictModel(title: "01:40", value: 28), PredictModel(title: "02:00", value: 24), PredictModel(title: "02:20", value: 18), PredictModel(title: "02:40", value: 26)]
