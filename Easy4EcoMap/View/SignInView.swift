//
//  SignInView.swift
//  Easy4EcoMap
//
//  Created by danyaq on 04.10.2021.
//

import SwiftUI
import UIKit

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @Binding var selected: Int
    @State var showPassword = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
           Color.init("Theme").edgesIgnoringSafeArea(.all)
        VStack(spacing: 0){
            Text("Добро\nпожаловать!")
             
                .font(.custom("Gilroy-Black", size: 36))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            VStack(spacing: 31){
                CustomTextFieldView(image: "User", textField: $email, text: "Email", trailingImage: "", showPassword: $showPassword)
                CustomTextFieldView(image: "Pass", textField: $password, text: "Password", trailingImage: "eye", showPassword: $showPassword)
            }
            Button {
                
            } label: {
                Text("Забыли пароль?")
                    .font(.custom("Gilroy-Regular", size: 16))
                    .foregroundColor(Color.red)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
            .padding(.top, 9)

            HStack{
                Text("Войти")
                    
                    .font(.custom("Gilroy-Bold", size: 24))
                Spacer()
                Button {
                    withAnimation{
                        selected = 2
                    }
                } label: {
                    ZStack{
                        Circle().foregroundColor(Color.red).frame(width: 51, height: 51)
                    Image("right")
                    }
                    .shadow(color: Color.red.opacity(0.46), radius: 26, x: 0, y: 10)
                }

            }
            .padding(.horizontal)
            .padding(.top, 49)
            Spacer()
            VStack(spacing: 25){
                Text("Войти через")
                    .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.5) : Color.black.opacity(0.5))
                    .font(.custom("Gilroy-Regular", size: 16))
                HStack(spacing: 40){
                    SignInCardView(image: "gos")
                    
                    SignInCardView(image: "mos")
                }
            }
            Spacer()
            HStack(spacing: 0){
                Text("Ещё нет аккаунта? ")
                    .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.5) : Color.black.opacity(0.5))
                    .font(.custom("Gilroy-Regular", size: 16))
            Button {
                
            } label: {
                Text("Зарегистрируйтесь!")
                    .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.6) : Color.black.opacity(0.6))
                    .font(.custom("Gilroy-Medium", size: 16))
            }
            }
            .padding(.bottom, 20)

        }
        }
    }
}

struct SignInCardView: View{
    @Environment(\.colorScheme) var colorScheme
    var image: String
    var body: some View{
        Button {
            
        } label: {
            ZStack{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    
                    .frame(width: 45, height: 45)
            }
          
        }
    }
}

struct CustomTextFieldView: View{
    @Environment(\.colorScheme) var colorScheme
    var image: String
    @Binding var textField: String
    var text: String
    var trailingImage: String
    @Binding var showPassword: Bool
    var body: some View{
        HStack(spacing: 10){
            Image(image)
            ZStack{
            if textField.isEmpty{
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
                if trailingImage != ""{
                    if showPassword{
                        TextField("", text: $textField)
                    } else {
                        SecureField("", text: $textField)
                    }
                } else {
                    TextField("", text: $textField)
                }
            }
            .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.5) : Color.black.opacity(0.5))
            .font(.custom("Gilroy-Medium", size: 12))
            Spacer(minLength: 0)
            if trailingImage != ""{
                Button {
                    showPassword.toggle()
                } label: {
                    Image(trailingImage)
                }

                
            }
        }
        .padding(.horizontal, 11)
        .padding(.vertical, 17)
        .background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(selected: .constant(1))
    }
}
