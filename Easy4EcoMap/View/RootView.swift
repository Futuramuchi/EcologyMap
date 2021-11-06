//
//  RootView.swift
//  Easy4EcoMap
//
//  Created by danyaq on 04.10.2021.
//

import SwiftUI

struct RootView: View {
    @State var selected = 1
    var body: some View {
        if selected == 1{
            SignInView(selected: $selected)
        } else if selected == 2{
//            MainMapView()
            MainTabView(selected: $selected)
        }
    }
}


