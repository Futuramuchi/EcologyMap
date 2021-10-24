//
//  HTMLParser.swift
//  Easy4EcoMap
//
//  Created by Даня on 24.10.2021.
//

import Foundation
import SwiftSoup

class HTMLParser: ObservableObject{
    @Published var air = ""
    @Published var pressure = ""
    @Published var humidity = ""
    @Published var visibilityRange = ""
    @Published var no2 = ""
    @Published var no = ""
    @Published var co = ""
    @Published var pm10 = ""
    init(){
        fetchDataFromSite()
        fetchParameters()
    }
    
    func fetchDataFromSite(){
        let url = "https://mosecom.mos.ru/"
        
        guard let myURL = URL(string: url) else { return }
        DispatchQueue.main.async {
            do {
                let htmlContent = try String(contentsOf: myURL, encoding: .utf8)
                let doc = try SwiftSoup.parse(htmlContent)
                let element = try doc.select("div.air-text").array()
                
                
                
                self.air = String(try element[0].text())
                self.pressure = String(try element[1].text())
                self.humidity = String(try element[2].text())
                self.visibilityRange = String(try element[3].text())
                }
                catch let error{
                    print(error.localizedDescription)
                }
        }
     
        }
     
    func fetchParameters(){
        let url = "https://mosecom.mos.ru/ostankino-0/"
        guard let myURL = URL(string: url) else { return }
  
            do{
                let htmlContent = try String(contentsOf: myURL, encoding: .utf8)
                let doc = try SwiftSoup.parse(htmlContent)
                let mainElement = try doc.select("div.front")
                let value = try mainElement.select("span.this-count").array()
                do{
                    self.co = try value[0].text()
                    self.no2 = try value[2].text()
                    self.no = try value[3].text()
                    self.pm10 = try value[7].text()
                } catch {
                    print(error.localizedDescription)
                }
               
            } catch let error {
                print(error.localizedDescription)
            
        }
     
    }
}
