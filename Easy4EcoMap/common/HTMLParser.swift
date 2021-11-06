//
//  HTMLParser.swift
//  Easy4EcoMap
//
//  Created by Даня on 24.10.2021.
//

import Foundation
import SwiftSoup

class HTMLParser: ObservableObject{
    @Published var result: CGFloat = 0
    @Published var summ: CGFloat = 0
    @Published var selectedStation = "ostankino-0"
    
    @Published var testTest = [IndicatorsModel]()
    @Published var indicators = [IndicatorsModel]()
    @Published var indicatorsAQI = [IndicatorsAQIModel]()
    init(){
        DispatchQueue.global(qos: .utility).async { () -> Void in
            self.fetchDataFromSite()
            self.fetchParameters(station: "ostankino-0")
        }
        
        
         
    }
    
    func fetchDataFromSite(){
        let url = "https://mosecom.mos.ru/"
        
        guard let myURL = URL(string: url) else { return }
        
        
        do {
            let htmlContent = try String(contentsOf: myURL, encoding: .utf8)
            let doc = try SwiftSoup.parse(htmlContent)
            let element = try doc.select("div.air-text").array()
            let air = String(try element[0].text())
            let pressure = String(try element[1].text())
            let humidity = String(try element[2].text())
            let visibilityRange = String(try element[3].text())
            DispatchQueue.main.async { [weak self] in
                self?.indicators = [IndicatorsModel(name: "Ветер", value: air),IndicatorsModel(name: "Давление", value: pressure), IndicatorsModel(name: "Влажность", value: humidity), IndicatorsModel(name: "Дальность видимости", value: visibilityRange)]
            }
            
            
            
        }
        catch let error{
            print(error.localizedDescription)
        }
        
        
    }
    
    func fetchParameters(station: String){
        self.indicatorsAQI.removeAll()
        self.summ = 0
        self.result = 0
        let url = "https://mosecom.mos.ru/\(selectedStation)/"
        guard let myURL = URL(string: url) else { return }
       
        do{
            let htmlContent = try String(contentsOf: myURL, encoding: .utf8)
            let doc = try SwiftSoup.parse(htmlContent)
            
            
            let firstElement = try doc.select("div.content-tab.active div.front")
            for s in firstElement{
                let test = try s.select("div.text-norma")
                let value = try s.select("span.this-count")
                let name = try test.text()
                let selectedValue = try value.text()
                let n = CGFloat((try value.text() as NSString).floatValue)
                self.summ = self.summ + n
                self.result = CGFloat(self.summ) / 4
                
                self.indicatorsAQI.append(IndicatorsAQIModel(name: name, value: selectedValue))
                
                
                
            }
            let aqi = String(format: "%.3f", CGFloat(self.result))
            DispatchQueue.main.async { [weak self] in
            
                self?.indicatorsAQI.append(IndicatorsAQIModel(name: "AQI", value: aqi))
                
            }
            print(self.result)
         
            
//                self?.indicatorsAQI = [IndicatorsAQIModel(name: "AQI", value: aqi),IndicatorsAQIModel(name: "CO", value: co), IndicatorsAQIModel(name: "NO2", value: no2), IndicatorsAQIModel(name: "NO", value: no), IndicatorsAQIModel(name: "PM10", value: pm10)]
                
            
        }
        catch let error {
            print(error.localizedDescription)
            
        }
        
        
    }
}






