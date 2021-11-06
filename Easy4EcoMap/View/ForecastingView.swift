//
//  ForecastingView.swift
//  Easy4EcoMap
//
//  Created by Даня on 24.10.2021.
//

import SwiftUI

struct ForecastingView: View {
//    @State var no2 = ""
//    @State var co = ""
//    @State var pm10 = ""
//    @State var no = ""
//    @State var speed = ""
//    @State var direction = ""
//    @State var pressure = ""
//    @State var humidity = ""
    @State var selected = -1
    @State var selection = 1
    @Environment(\.colorScheme) var colorScheme
    @State var date = Date()
    @Binding var showInfo: Bool
    @Binding var titleText: String
//    let dateStringFormatter = DateFormatter()
//    let timeStringFormatter = DateFormatter()
    @Binding var infoText: String
    @StateObject var predictedVM = PredictViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Color.init("Theme").edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false){
                    Picker("", selection: $selection) {
                        
                        Text("NO")
                            .tag(1)
                        Text("PM10")
                            .tag(2)
                    }
                    .padding(5)
                    .pickerStyle(SegmentedPickerStyle())
                    .background(colorScheme == .light ? Color.white : Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .padding([.top, .horizontal])
                    VStack(alignment: .leading, spacing: 15){
                        VStack(spacing: 10){
                        HStack{
                            Text("Изменение показателей")
                                .font(.custom("Gilroy-Bold", size: 19))
                                .fontWeight(.bold)
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            Spacer()
                            Button {
                                
                            } label: {
                               Image(systemName: "square.and.arrow.up.on.square")
                                    .font(.title2)
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }

                        }
                            DatePicker("", selection: $date, displayedComponents: .date)
                                .datePickerStyle(CompactDatePickerStyle())
                                .labelsHidden()
                                .accentColor(colorScheme == .dark ? Color.white : Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 7){
                        ForEach(testPredict, id: \.id){item in
                            VStack(spacing: 20){
                                GeometryReader{proxy in
                                    let size = proxy.size
                                    
                                    RoundedRectangle(cornerRadius: 4)
                                        .foregroundColor(getColor(n: item.value))
                                        .frame(height: (item.value / getMax()) * (size.height))
                                       
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                }
                                Text(item.title)
                                    .font(.system(size: 13))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 46)
                          
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 200)
                    }
                    }
                    .padding(.vertical)
                    .background(colorScheme == .light ? Color.white : Color.white.opacity(0.1))
                    
                    .cornerRadius(10)
                    .shadow(color: colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.12), radius: 21, x: 0, y: 0)
                    .padding()
                    VStack(spacing: 10){
                        Text("Сортировать")
                            .font(.custom("Gilroy-Bold", size: 19))
                            .fontWeight(.bold)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10){
                        Text("Смотреть все")
                            .font(.custom("Gilroy-Medium", size: 18))
                            .frame(height: 24)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(colorScheme == .dark && selected == -1 ? Color.black.opacity(0.5) : colorScheme == .light && selected == -1 ? Color.black.opacity(0.1) : Color.clear)
                            .cornerRadius(8)
                            .onTapGesture {
                                withAnimation {
                                    selected = -1
                                }
                            }
                        ForEach(0..<colorsModel.count){color in
                            HStack(spacing: 5){
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(colorsModel[color].color)
                                .frame(width: 24, height: 24)
                                Text(colorsModel[color].title)
                                    .font(.custom("Gilroy-Medium", size: 18))
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(colorScheme == .dark && selected == color ? Color.black.opacity(0.5) : colorScheme == .light && selected == color ? Color.black.opacity(0.1) : Color.clear)
                            .cornerRadius(8)
                            .onTapGesture {
                                withAnimation {
                                    selected = color
                                }
                            }
                            .id(colorsModel[color].id)
                        }
                        
                    }
                    .padding()
                    
                    
                    
                    }
                    }
                    
                    .background(colorScheme == .light ? Color.white : Color.white.opacity(0.1))
                    .shadow(color: colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.12), radius: 21, x: 0, y: 0)
                    .cornerRadius(10)
                    .padding(.horizontal)
                        
                }
            }
            .navigationTitle("Прогноз")
        }
        
    }
    func getMax()->CGFloat{
        let max = testPredict.max { first, second in
            return second.value > first.value
        }
        return max?.value ?? 0
    }
    func getColor(n: CGFloat)->Color{
        if CGFloat(n) >= 0 && CGFloat(n) <= 20{
            return Color.init(#colorLiteral(red: 0.03863913938, green: 0.5215001106, blue: 0.9888014197, alpha: 1))
        } else if CGFloat(n) > 20 && CGFloat(n) <= 40{
            return Color.init(#colorLiteral(red: 0.1928932369, green: 0.8186139464, blue: 0.340090394, alpha: 1))
        } else if CGFloat(n) > 40 && CGFloat(n) <= 60{
            return Color.init(#colorLiteral(red: 0.9761707187, green: 0.838077724, blue: 0.05100912601, alpha: 1))
        } else if CGFloat(n) > 60 && CGFloat(n) <= 80{
            return Color.init(#colorLiteral(red: 0.9979802966, green: 0.5443971753, blue: 0.08056228608, alpha: 1))
        } else if CGFloat(n) > 80 && CGFloat(n) <= 100{
            return Color.init(#colorLiteral(red: 0.9973474145, green: 0.3185609877, blue: 0.1989937425, alpha: 1))
        }
        return Color.red
    }
}




//                    VStack(spacing: 0){
//
//                        VStack(spacing: 10){
//                            VStack(alignment: .leading,spacing: 10){
//                                Text("Дата и время")
//                                DatePicker("", selection: $date)
//                                    .datePickerStyle(CompactDatePickerStyle())
//                                    .labelsHidden()
//                            }
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            VStack(alignment: .leading, spacing: 10){
//                                Text("NO2")
//                                TextField("ПДК", text: $no2)
//                                    .padding(.horizontal, 11)
//                                    .padding(.vertical, 17)
//                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
//                                    .cornerRadius(10)
//
//                            }
//
//                            VStack(alignment: .leading, spacing: 10){
//                                Text("NO")
//                                TextField("ПДК", text: $no)
//                                    .padding(.horizontal, 11)
//                                    .padding(.vertical, 17)
//                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
//                                    .cornerRadius(10)
//
//                            }
//                            VStack(alignment: .leading, spacing: 10){
//                                Text("PM10")
//                                TextField("ПДК", text: $pm10)
//                                    .padding(.horizontal, 11)
//                                    .padding(.vertical, 17)
//                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
//                                    .cornerRadius(10)
//
//                            }
//                            VStack(alignment: .leading, spacing: 10){
//                                Text("Скорость ветра")
//                                TextField("м/с", text: $speed)
//                                    .padding(.horizontal, 11)
//                                    .padding(.vertical, 17)
//                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
//                                    .cornerRadius(10)
//
//                            }
//                            VStack(alignment: .leading, spacing: 10){
//                                Text("Направление ветра")
//                                TextField("градусов °", text: $direction)
//                                    .padding(.horizontal, 11)
//                                    .padding(.vertical, 17)
//                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
//                                    .cornerRadius(10)
//
//                            }
//                            VStack(alignment: .leading, spacing: 10){
//                                Text("Давление")
//                                TextField("мм рт. ст", text: $pressure)
//                                    .padding(.horizontal, 11)
//                                    .padding(.vertical, 17)
//                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
//                                    .cornerRadius(10)
//
//                            }
//                            VStack(alignment: .leading, spacing: 10){
//                                Text("Влажность")
//                                TextField("мм рт. ст", text: $humidity)
//                                    .padding(.horizontal, 11)
//                                    .padding(.vertical, 17)
//                                    .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
//                                    .cornerRadius(10)
//
//                            }
//                        }
//                        .padding(.horizontal)
//                        .font(.system(size: 14))
//                        Button {
//                            withAnimation {
//                                dateStringFormatter.dateFormat = "dd.MM.yyyy"
//                                let newDate = dateStringFormatter.string(from: date)
//                                timeStringFormatter.dateFormat = "HH:mm"
//                                let newTime = timeStringFormatter.string(from: date)
//                                predictedVM.predictParameter(url: predictedVM.no2URL, date: newDate, time: newTime, co: Double(co) ?? 0, no: Double(no) ?? 0, pm10: Double(pm10) ?? 0, scorost: Double(speed) ?? 0, napravlenie: Double(direction) ?? 0, davlenie: Double(pressure) ?? 0, vlajnost: Double(humidity) ?? 0)
//                                showInfo = true
//                                titleText = "Прогноз"
//                                infoText = "NO2: \(UserDefaults.standard.string(forKey: "score") ?? "")"
//                            }
//                        } label: {
//                            Text("Спрогнозировать")
//                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
//                                .font(.custom("Gilroy-Semibold", size: 22))
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .padding(.vertical, 18)
//                                .background(colorScheme == .dark ? Color.black : Color.white)
//                                .cornerRadius(10)
//                                .padding()
//                        }
//
//                    }
//                    .padding(.vertical)
