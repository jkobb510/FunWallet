//
//  Home.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/24/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            WishList()
                .tabItem {
                    Label("WishList", systemImage: "heart")
                }
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(Wish())
    }
}

