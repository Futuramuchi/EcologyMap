//
//  SettingsView.swift
//  Easy4EcoMap
//
//  Created by danyaq on 05.10.2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var showNotification = true
    @Binding var selected: Int
    var body: some View {
        NavigationView{
                ZStack{
                    Color.init("Theme").edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16){
                    VStack(alignment: .leading, spacing: 16){
                        Text("Основные")
                            .font(.custom("Gilroy-Bold", size: 21))
                        VStack(spacing: 0){
                            NavigationLink {
                                
                            } label: {
                                HStack(spacing: 10){
                                    Image(systemName: "person")
                                        .font(.custom("Gilroy-Semibold", size: 19))
                                    Text("Профиль")
                                        .font(.custom("Gilroy-Semibold", size: 19))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.custom("Gilroy-Semibold", size: 19))
                                }
                                .padding(.horizontal, 16)
                                .frame(height: 58)
                            }
                            Divider()
                            
                                HStack(spacing: 10){
                                    Image(systemName: "bell.badge")
                                        .font(.custom("Gilroy-Semibold", size: 19))
                                    Toggle("Уведомления", isOn: $showNotification)
                                        .font(.custom("Gilroy-Semibold", size: 19))
                                }
                                .padding(.horizontal, 16)
                                .frame(height: 58)
                            

                        }
                        .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.72) : Color.black.opacity(0.72))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(colorScheme == .light ? Color.white : Color.white.opacity(0.1))
                        .cornerRadius(10)
                    }
                        VStack(alignment: .leading, spacing: 16){
                            Text("Поддержка")
                                .font(.custom("Gilroy-Bold", size: 21))
                            VStack(spacing: 0){
                                NavigationLink {
                                    
                                } label: {
                                    HStack(spacing: 10){
                                        Image(systemName: "questionmark.circle")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                        Text("FAQ")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                    }
                                    .padding(.horizontal, 16)
                                    .frame(height: 58)
                                }

                                Divider()
                                NavigationLink {
                                    
                                } label: {
                                    HStack(spacing: 10){
                                        Image(systemName: "exclamationmark.circle")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                        Text("Пользовательский гайд")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                    }
                                    .padding(.horizontal, 16)
                                    .frame(height: 58)
                                }

                                Divider()
                                   
                                NavigationLink {
                                    
                                } label: {
                                    HStack(spacing: 10){
                                        Image(systemName: "phone")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                        Text("Связаться с нами")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.custom("Gilroy-Semibold", size: 19))
                                    }
                                    .padding(.horizontal, 16)
                                    .frame(height: 58)
                                }

                            }
                            .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.72) : Color.black.opacity(0.72))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(colorScheme == .light ? Color.white : Color.white.opacity(0.1))
                            .cornerRadius(10)
                        }
                        Button {
                            withAnimation{
                                selected = 1
                            }
                        } label: {
                            HStack(spacing: 10){
                                Image(systemName: "arrow.right.doc.on.clipboard")
                                    .font(.custom("Gilroy-Semibold", size: 19))
                                Text("Выйти")
                                    .font(.custom("Gilroy-Semibold", size: 19))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.custom("Gilroy-Semibold", size: 19))
                            }
                            .padding(.horizontal, 16)
                            .frame(height: 58)
                            .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.72) : Color.black.opacity(0.72))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(colorScheme == .light ? Color.white : Color.white.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                }
            }
            .navigationTitle("Настройки")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
            }
    }
}

