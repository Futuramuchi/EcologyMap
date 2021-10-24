//
//  ForecastingView.swift
//  Easy4EcoMap
//
//  Created by Даня on 24.10.2021.
//

import SwiftUI

struct ForecastingView: View {
    @State var no2 = ""
    @State var co = ""
    @State var pm10 = ""
    @State var no = ""
    @State var speed = ""
    @State var direction = ""
    @State var pressure = ""
    @State var humidity = ""
    @Environment(\.colorScheme) var colorScheme
    @State var date = Date()
    @Binding var showInfo: Bool
    @Binding var titleText: String
    let dateStringFormatter = DateFormatter()
    let timeStringFormatter = DateFormatter()
    @Binding var infoText: String
    @StateObject var predictedVM = PredictViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Color.init("Theme").edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 0){

                        VStack(spacing: 10){
                            VStack(alignment: .leading,spacing: 10){
                                Text("Дата и время")
                                DatePicker("", selection: $date)
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .labelsHidden()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            VStack(alignment: .leading, spacing: 10){
                                Text("NO2")
                                TextField("ПДК", text: $no2)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 17)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                 
                            }
                           
                            VStack(alignment: .leading, spacing: 10){
                                Text("NO")
                                TextField("ПДК", text: $no)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 17)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                   
                            }
                            VStack(alignment: .leading, spacing: 10){
                                Text("PM10")
                                TextField("ПДК", text: $pm10)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 17)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                   
                            }
                            VStack(alignment: .leading, spacing: 10){
                                Text("Скорость ветра")
                                TextField("м/с", text: $speed)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 17)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                   
                            }
                            VStack(alignment: .leading, spacing: 10){
                                Text("Направление ветра")
                                TextField("градусов °", text: $direction)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 17)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                   
                            }
                            VStack(alignment: .leading, spacing: 10){
                                Text("Давление")
                                TextField("мм рт. ст", text: $pressure)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 17)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                   
                            }
                            VStack(alignment: .leading, spacing: 10){
                                Text("Влажность")
                                TextField("мм рт. ст", text: $humidity)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 17)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                   
                            }
                        }
                        .padding(.horizontal)
                        .font(.system(size: 14))
                        Button {
                            withAnimation {
                                dateStringFormatter.dateFormat = "dd.MM.yyyy"
                                let newDate = dateStringFormatter.string(from: date)
                                timeStringFormatter.dateFormat = "HH:mm"
                                let newTime = timeStringFormatter.string(from: date)
                                predictedVM.predictParameter(url: predictedVM.no2URL, date: newDate, time: newTime, co: Double(co) ?? 0, no: Double(no) ?? 0, pm10: Double(pm10) ?? 0, scorost: Double(speed) ?? 0, napravlenie: Double(direction) ?? 0, davlenie: Double(pressure) ?? 0, vlajnost: Double(humidity) ?? 0)
                                showInfo = true
                                titleText = "Прогноз"
                                infoText = "NO2: \(UserDefaults.standard.string(forKey: "score") ?? "")"
                            }
                        } label: {
                            Text("Спрогнозировать")
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                .font(.custom("Gilroy-Semibold", size: 22))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.vertical, 18)
                                .background(colorScheme == .dark ? Color.black : Color.white)
                                .cornerRadius(10)
                                .padding()
                        }

                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Прогноз")
        }
    }
}

