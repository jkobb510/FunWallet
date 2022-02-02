//
//  HomeView.swift
//  FW-App
//
//  Created by Seung (Jacob) Lee on 1/30/22.
//


import SwiftUI

struct HomeView: View {
   

    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    init() {
    UITabBar.appearance().backgroundColor = UIColor(lightGreyColor)

    }
     
        

    var body: some View {
   
        TabView {
            MainView()
                .tabItem {
                    Label("Explore", systemImage: "house")
                }

            WishList()
                .tabItem {
                    Label("WishList", systemImage: "heart")
                }
            
        }
 
    }
    
        
    }



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
          
    }
}
