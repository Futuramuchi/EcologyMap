//
//  ColorModel.swift
//  Easy4EcoMap
//
//  Created by Даня on 07.11.2021.
//

import Foundation
import SwiftUI


struct ColorModel: Identifiable{
    var id = UUID().uuidString
    var title: String
    var color: Color
}

var colorsModel = [ColorModel(title: "Отличные", color: Color.init(#colorLiteral(red: 0.03863913938, green: 0.5215001106, blue: 0.9888014197, alpha: 1))), ColorModel(title: "Хорошие", color: Color.init(#colorLiteral(red: 0.1928932369, green: 0.8186139464, blue: 0.340090394, alpha: 1))), ColorModel(title: "Нормальные", color: Color.init(#colorLiteral(red: 0.9761707187, green: 0.838077724, blue: 0.05100912601, alpha: 1))), ColorModel(title: "Плохие", color: Color.init(#colorLiteral(red: 0.9979802966, green: 0.5443971753, blue: 0.08056228608, alpha: 1))), ColorModel(title: "Опасные", color: Color.init(#colorLiteral(red: 0.9973474145, green: 0.3185609877, blue: 0.1989937425, alpha: 1)))]
