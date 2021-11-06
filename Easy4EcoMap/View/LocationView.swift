//
//  LocationView.swift
//  Easy4EcoMap
//
//  Created by danyaq on 05.10.2021.
//

import SwiftUI
import MapKit

@available(iOS 15.0, *)
struct LocationView: View {
    @State var showMessage = false
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var presentationMode
    @EnvironmentObject var locationViewModel: LocationManagerViewModel
    @EnvironmentObject var htmlParser: HTMLParser
    var body: some View {
        VStack(spacing: 0){
            Text("Местоположение")
                .font(.custom("Gilroy-Semibold", size: 21))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 14)
                .background(Color.init("Theme"))
                .overlay(
                    Button(action: {
                        presentationMode()
                    }, label: {
                        ZStack{
                            
                            Circle().frame(width: 30, height: 30)
                                .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.7))
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                            
                            
                        }
                    })
                        .padding(.trailing)
                    ,alignment: .trailing)
            ZStack{
            VStack(spacing: 0){
            HStack(spacing: 12){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 21))
                TextField("Введите адресс", text: $locationViewModel.searchText)
                if !locationViewModel.searchText.isEmpty{
                    Button {
                        locationViewModel.searchText = ""
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }

                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color("Theme"))
            .cornerRadius(10)
           
                if !locationViewModel.searchModel.isEmpty && locationViewModel.searchText != ""{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 0){
                            ForEach(locationViewModel.searchModel){place in
                                Button {
                                    if place.place.location != nil{
                                        locationViewModel.map.setRegion(MKCoordinateRegion(center: place.place.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
                                        locationViewModel.searchText = ""
                                    }
                                } label: {
                                    VStack{
                                        Spacer()
                                    Text(place.place.name ?? "")
                                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                        Spacer()
                                        Divider()
                                            .offset(y: 1)
                                    }
                                   
                                    .frame(minHeight: 50)
                                }

                               
                                
                            }
                        }
                        .background(Color("search"))
                        .cornerRadius(10)
                    }
                    .padding(.top, 5)
                }

            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            .zIndex(1)
                MainMapView().environmentObject(locationViewModel).environmentObject(htmlParser)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .padding(.top)
            VStack(spacing: 10){
                VStack(spacing: 2){
                    if locationViewModel.address != ""{
                Text("Ваш адресс: \(locationViewModel.address)")
                    .lineLimit(2)
                    .font(.custom("Gilroy-Medium", size: 21))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if !locationViewModel.district.isEmpty{
                        Text("Район: \(locationViewModel.district)")
                            .lineLimit(2)
                            .font(.custom("Gilroy-Medium", size: 21))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                    }
                }
                .padding(.horizontal)
                    .frame(height: 70)
                Button {
                   
                    if let station = UserDefaults.standard.string(forKey: "station"){
                        locationViewModel.districtMain = locationViewModel.district
                        htmlParser.selectedStation = station
                        DispatchQueue.main.async {
                            htmlParser.fetchParameters(station: htmlParser.selectedStation)
                        }
                        presentationMode()
                        UserDefaults.standard.removeObject(forKey: "station")
                    } else {
                        showMessage.toggle()
                    }
                    
                    
                } label: {
                    Text("Применить")
                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        .font(.custom("Gilroy-Semibold", size: 22))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 18)
                        .background(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(10)
                        .padding()
                }
                
            }
            .alert(isPresented: $showMessage, content: {
                Alert(title: Text("Пожалуйста, выберите ближайшую станцию"))
            })
            .padding(.top)
        }
        .onChange(of: locationViewModel.searchText) { value in
            let delay = 0.4
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                if value == locationViewModel.searchText{
                    locationViewModel.mapSearch()
                }
            }
        }
    }
}


