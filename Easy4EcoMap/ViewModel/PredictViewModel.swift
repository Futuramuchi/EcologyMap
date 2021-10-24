//
//  PredictViewModel.swift
//  Easy4EcoMap
//
//  Created by Даня on 24.10.2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class PredictViewModel: ObservableObject{
    @Published var predictedNO = ""
    
    let no2URL = "http://no2.makievksy.ru.com/predict"
    let noURL = "http://no.makievksy.ru.com/predict"
    let coURL = "http://co.makievksy.ru.com/predict"
    let pm10URL = "http://pm10.makievksy.ru.com/predict"
    init(){
        
    }
    
    func predictParameter(url: String, date: String, time: String, co: Double, no: Double, pm10: Double, scorost: Double, napravlenie: Double, davlenie: Double, vlajnost: Double){
        let parameters: Parameters = ["Date": date,
                          "Time": time,
                          "CO":co,
                          "NO":no,
                          "PM10":pm10,
                          "SkorostVetra":scorost,
                          "NapravlenieVetra":napravlenie,
                          "Davlenie":davlenie,
                          "Vlajnost":vlajnost]
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        let url = URL(string: url)!
        AF.request(url,method: .post,parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON{response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let score = json["score"].stringValue
                UserDefaults.standard.set(score, forKey: "score")
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
