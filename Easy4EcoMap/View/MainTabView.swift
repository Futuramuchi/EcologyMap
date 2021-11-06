//
//  MainTabView.swift
//  Easy4EcoMap
//
//  Created by danyaq on 05.10.2021.
//

import SwiftUI

struct MainTabView: View {
    @State var selection = 1
    @State var showInfo = false
    @State var titleText = ""
    @State var infoText = ""
    @State var isHomeView = false
    @StateObject var htmlParser = HTMLParser()
    @Binding var selected: Int
    init(selected: Binding<Int>){
        self._selected = selected
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
        if showInfo{
            InfoAQIView(titleText: $titleText, infoText: $infoText,showInfo: $showInfo, isHomeView: $isHomeView).zIndex(1)
        }
        VStack(spacing: 0){
        TabView(selection: $selection) {
            HomeView(showInfo: $showInfo, titleText: $titleText, infoText: $infoText, isHomeView: $isHomeView).environmentObject(htmlParser)
                .tag(1)
            ForecastingView(showInfo: $showInfo, titleText: $titleText, infoText: $infoText)
                .animation(.none)
                .tag(2)
            WebView(url: "http://eco-monitoring.easy4.fun/")
                .animation(.none)
                .tag(3)
            SettingsView(selected: $selected)
                .animation(.none)
                .tag(4)
        }
        
            CustomTabView(selection: $selection)
        }
        }
    }
}


struct CustomTabView: View{
    @Environment(\.colorScheme) var colorScheme
    @Binding var selection: Int
    var body: some View{
        VStack(spacing: 0){
            Divider()
        HStack{
            Button {
                withAnimation(.easeInOut){
                    selection = 1
                }
            } label: {
                VStack{
                    
                        Image("1")
                       
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(selection == 1 ? Color.clear : Color.white.opacity(0.5))
                        .opacity(selection == 1 ? 1 : 0.6)
                    if selection == 1{
                        Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(Color.purple)
                    }
                  
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            Button {
                withAnimation(.easeInOut){
                    selection = 2
                }
            } label: {
                VStack{
                    
                        Image("2")
                     
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(selection == 2 ? Color.clear : Color.white.opacity(0.5))
                        .opacity(selection == 2 ? 1 : 0.6)
                    if selection == 2{
                        Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(Color.purple)
                    }
                  
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            Button {
                withAnimation(.easeInOut){
                    selection = 3
                }
            } label: {
                VStack{
                    
                        Image("3")
                     
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(selection == 3 ? Color.clear : Color.white.opacity(0.5))
                        .opacity(selection == 3 ? 1 : 0.6)
                    if selection == 3{
                        Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(Color.purple)
                    }
                  
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            Button {
                withAnimation(.easeInOut){
                    selection = 4
                }
            } label: {
                VStack{
                    
                        Image("4")
                     
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(selection == 4 ? Color.clear : Color.white.opacity(0.5))
                        .opacity(selection == 4 ? 1 : 0.6)
                    if selection == 4{
                        Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(Color.purple)
                    }
                  
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.vertical, 5)
        .background(Color.init("Theme").edgesIgnoringSafeArea(.all))
        }
        
    }
}
