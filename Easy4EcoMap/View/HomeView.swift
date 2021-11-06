//
//  HomeVie.swift
//  Easy4EcoMap
//
//  Created by danyaq on 05.10.2021.
//

import SwiftUI
import Charts

struct HomeView: View {
    @EnvironmentObject var htmlParser: HTMLParser
    @Binding var showInfo: Bool
    @Binding var titleText: String
    @Binding var infoText: String
    @Binding var isHomeView: Bool
    @State var angle: Double = 0
    @State var fakeOffset: CGFloat = 180
    @State var progress: CGFloat = 0
    @Environment(\.colorScheme) var colorScheme
    @StateObject var locationViewModel = LocationManagerViewModel()
    @State var showLocationView = false
    @State var district = ""
    @State var selected: IndicatorsAQIModel? = nil
    
    @State var size: CGFloat = 250
    var body: some View {
        
        
        NavigationView{
            ZStack{
                Color.init("Theme").edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    if !htmlParser.indicatorsAQI.isEmpty && !htmlParser.indicators.isEmpty{
                        VStack{
                            
                            HStack(alignment: .top){
                                Image(systemName: "location.fill")
                                    .font(.system(size: 19))
                                HStack{
                                    Text("г. Москва, район \(locationViewModel.districtMain)")
                                    if locationViewModel.districtMain == ""{
                                        ProgressView()
                                            .padding(.leading, 4)
                                    }
                                }
                                .font(.custom("Gilroy-Bold", size: 21))
                                Spacer(minLength: 0)
                                Button {
                                    showLocationView.toggle()
                                } label: {
                                    Image(systemName: "gearshape")
                                        .font(.system(size: 19))
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                                .sheet(isPresented: $showLocationView) {
                                    if #available(iOS 15.0, *) {
                                        LocationView().environmentObject(locationViewModel).environmentObject(htmlParser)
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(colorScheme == .dark ? Color.white.opacity(0.04) : Color.black.opacity(0.08))
                            .cornerRadius(10)
                            .padding()
                            VStack{
                                TopCardView().environmentObject(htmlParser)
                                AirQualityView(isHomeView: $isHomeView, showInfo: $showInfo,angle: $angle, progress:$progress, size: $size, titleText: $titleText, infoText: $infoText, selected: $selected, fakeOffset: $fakeOffset).environmentObject(htmlParser)
                            }
                            
                        }
                        .padding(.bottom, 16)
                    } else {
                        VStack{
                            Spacer()
                            ProgressView()
                                .padding(.top, UIScreen.main.bounds.height / 2 - 130)
                            Spacer()
                        }
                    }
                    
                }
                
                
            }
            .onChange(of: htmlParser.indicatorsAQI, perform: { newValue in
                selected = newValue.first
                let n = CGFloat(((newValue.first?.value ?? "0") as NSString).floatValue)
                progress = n
            })
            
            .navigationTitle("Показатели")
            .onChange(of: locationViewModel.location, perform: { _ in
                DispatchQueue.global(qos: .utility).async {
                    locationViewModel.coordinateToLocation(lat: locationViewModel.location?.coordinate.latitude ?? 0, lon: locationViewModel.location?.coordinate.longitude ?? 0)
                }
            })
            
        }
        
        .navigationViewStyle(DefaultNavigationViewStyle())
        
        
    }
    
}

struct TopCardView: View{
    @EnvironmentObject var htmlParser: HTMLParser
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        if !htmlParser.indicators.isEmpty{
            VStack{
                HStack{
                    VStack(spacing: 10){
                        Text(htmlParser.indicators[0].name)
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(Color.gray)
                        Text("\(htmlParser.indicators[0].value)")
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    Divider()
                    VStack(spacing: 10){
                        Text(htmlParser.indicators[1].name)
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(Color.gray)
                        Text("\(htmlParser.indicators[1].value)")
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                Divider()
                HStack{
                    VStack(spacing: 10){
                        Text(htmlParser.indicators[2].name)
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(Color.gray)
                        Text("\(htmlParser.indicators[2].value)")
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    Divider()
                    VStack(spacing: 10){
                        Text(htmlParser.indicators[3].name)
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(Color.gray)
                        Text("\(htmlParser.indicators[3].value)")
                            .font(.custom("Gilroy-Medium", size: 18))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding([.bottom, .horizontal])
        } else {
            ProgressView()
        }
    }
}

struct AirQualityItemView: View{
    var value, image: String
    var body: some View{
        HStack{
            Image(image)
                .resizable()
                .frame(width: 25, height: 25)
            Text(value)
                .font(.custom("Gilroy-Bold", size: 16))
        }
    }
}

struct AirQualityView: View{
    @Binding var isHomeView: Bool
    @Binding var showInfo: Bool
    @Binding var angle: Double
    @Binding var progress: CGFloat
    @Binding var size: CGFloat
    @Binding var titleText: String
    @Binding var infoText: String
    @Binding var selected: IndicatorsAQIModel?
    @Binding var fakeOffset: CGFloat
    @EnvironmentObject var htmlParser: HTMLParser
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        if !htmlParser.indicatorsAQI.isEmpty{
            VStack(spacing: 0){
                HStack{
                    Text("Индекс качества воздуха")
                        .font(.custom("Gilroy-Semibold", fixedSize: 21))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    Button {
                        withAnimation {
                            isHomeView = true
                            showInfo = true
                            titleText = "Информация"
                            infoText = "Индекс качества воздуха (AQI) представляет собой применяемую во всем мире, условную измерительную единицу(ПДК), которая предоставляет необходимые данные о загрязнениях в наиболее простой и понятной форме."
                        }
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: 23))
                            .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.8) : Color.black.opacity(0.8))
                    }
                    
                }
                .padding([.top,.horizontal])
                ZStack{
                    Circle()
                        .trim(from: 0.5, to: 1)
                    
                        .stroke(LinearGradient(colors: [Color.blue, Color.green, Color.yellow, Color.orange, Color.red], startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .bevel))
                    
                        .frame(width: size, height: size)
                        .offset(y: 50)
                    
                        .overlay(VStack(spacing: 6){
                            Text("\(selected?.name ?? "")")
                                .font(.custom("Gilroy-Bold", size: 21))
                                .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.7))
                            Text("\(String(format: "%.3f",progress))")
                                .font(.custom("Gilroy-Black", size: 48))
                                .animation(.none)
                            Text(getStatus())
                                .font(.custom("Gilroy-Medium", size: 19))
                                .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.7))
                        }
                                    .animation(.none))
                    
                    Circle()
                        .frame(width: 500, height: 500)
                        .foregroundColor(Color.clear)
                        .overlay(Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    .overlay(Circle().stroke(lineWidth: 4).foregroundColor(colorScheme == .light ? .white : .black))
                        )
                        .offset(x: -size / 2)
                        .rotationEffect(.init(degrees: fakeOffset))
                        .rotationEffect(.init(degrees: progress == 0 ? 0.0000001 : 180 * progress))
                    
                        .offset(y: 50)
                    
                    
                }
                .frame(width: 230, height: 230)
                VStack(spacing: 24){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 15){
                            ForEach(htmlParser.indicatorsAQI, id: \.id){item in
                                
                                VStack(spacing: 4){
                                    Circle()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.2))
                                        .opacity(selected == item ? 1 : 0)
                                        .overlay(Text(item.value).font(.custom("Gilroy-Medium", size: 14)), alignment: .center)
                                    Text("\(item.name)")
                                        .font(.custom("Gilroy-Regular", size: 19))
                                        .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.7))
                                }
                                
                                .onTapGesture {
                                    
                                    withAnimation{
                                        let n = CGFloat((item.value as NSString).floatValue)
                                        self.progress = n
                                        selected = item
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .offset(y: -20)
                
            }
            .onAppear(perform: {
                self.fakeOffset = fakeOffset - (180 * progress)
                withAnimation(.easeIn(duration: 1.2)) {
                    fakeOffset = 0
                }
            })
            .frame(maxWidth: .infinity, alignment: .center)
            
            .background(colorScheme == .light ? Color.white : Color.white.opacity(0.1))
            
            .cornerRadius(10)
            .shadow(color: colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.12), radius: 21, x: 0, y: 0)
            .padding(.horizontal)
            .onAppear {
                
                if self.selected == nil{
                    self.selected = htmlParser.indicatorsAQI.first
                }
                withAnimation(.easeInOut(duration: 1.2)){
                    let n = CGFloat(((htmlParser.indicatorsAQI.first?.value ?? "0") as NSString).floatValue)
                    
                    self.progress = n
                }
            }
        } else {
            ProgressView()
        }
    }
    func getStatus() -> String{
        let n = CGFloat(((selected?.value ?? "0") as NSString).floatValue)
        
        if CGFloat(n) >= 0 && CGFloat(n) <= 0.2{
            return "Отличный показатель"
        } else if CGFloat(n) > 0.2 && CGFloat(n) <= 0.4{
            return "Хороший показатель"
        } else if CGFloat(n) > 0.4 && CGFloat(n) <= 0.6{
            return "Показатель в норме"
        } else if CGFloat(n) > 0.6 && CGFloat(n) <= 0.8{
            return "Среднее загрязнение"
        } else if CGFloat(n) > 0.8 && CGFloat(n) <= 1{
            return "Сильное загрязнение"
        } else {
            return "Опасное загрязнение"
        }
    }
}



struct ItemCardView: View{
    @Environment(\.colorScheme) var colorScheme
    var image: String
    var title: String
    var value: String
    var body: some View{
        VStack(alignment: .center){
            Text(title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.6) : Color.black.opacity(0.6))
                .frame(maxWidth: .infinity, alignment: .center)
            HStack(spacing: 5){
                Image(image)
                    .resizable()
                    .frame(width: 35, height: 35)
                Text(value)
                    .font(.system(size: 24, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}



struct InfoAQIView: View{
    @Binding var titleText: String
    @Binding var infoText: String
    @Binding var showInfo: Bool
    @Binding var isHomeView: Bool
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            if colorScheme == .dark{
                Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showInfo = false
                        }
                    }
            } else {
                Color.white.opacity(0.5).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showInfo = false
                        }
                    }
            }
            VStack(spacing: 5){
                HStack{
                    Spacer()
                    ZStack{
                        
                        Circle().frame(width: 30, height: 30)
                            .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.7))
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        
                        
                    }
                    .onTapGesture(perform: {
                        withAnimation {
                            showInfo = false
                        }
                    })
                }
                .overlay(Text("\(titleText)").foregroundColor(colorScheme == .dark ? Color.white : Color.black).font(.system(size: 18, weight: .semibold)))
                Text("\(infoText)")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .multilineTextAlignment(.leading)
                if isHomeView{
                    VStack(alignment: .leading, spacing: 10){
                        HStack(spacing: 10){
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 15, height: 7.5)
                                .foregroundColor(Color.init(#colorLiteral(red: 0.03863913938, green: 0.5215001106, blue: 0.9888014197, alpha: 1)))
                            Text("Отличный показатель")
                            
                        }
                        HStack(spacing: 10){
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 15, height: 7.5)
                                .foregroundColor(Color.init(#colorLiteral(red: 0.1928932369, green: 0.8186139464, blue: 0.340090394, alpha: 1)))
                            Text("Хороший показатель")
                            
                        }
                        HStack(spacing: 10){
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 15, height: 7.5)
                                .foregroundColor(Color.init(#colorLiteral(red: 0.9761707187, green: 0.838077724, blue: 0.05100912601, alpha: 1)))
                            Text("Показатель в норме")
                            
                        }
                        HStack(spacing: 10){
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 15, height: 7.5)
                                .foregroundColor(Color.init(#colorLiteral(red: 0.9979802966, green: 0.5443971753, blue: 0.08056228608, alpha: 1)))
                            Text("Среднее загрязнение")
                            
                        }
                        HStack(spacing: 10){
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 15, height: 7.5)
                                .foregroundColor(Color.init(#colorLiteral(red: 0.9973474145, green: 0.3185609877, blue: 0.1989937425, alpha: 1)))
                            Text("Сильное загрязнение")
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            .background(colorScheme == .dark ? Color.black : Color.white)
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.bottom)
            .shadow(color: colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.2), radius: 22, x: 0, y: 0)
        }
    }
}
