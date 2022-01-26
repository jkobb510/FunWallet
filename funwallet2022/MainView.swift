//
//  MainView.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/24/22.
//

import SwiftUI

struct MainView: View {
    let event = Bundle.main.decode([EventSection].self, from: "event.json")

      var body: some View {
          NavigationView {
              VStack {

                  HStack{
                  NavigationLink(destination: HomeSelectLocation()){
                      
                      Image(systemName: "magnifyingglass").foregroundColor(.gray)
                      Text("Search Events")
                          .font(.body)
                          .foregroundColor(Color.gray)
                          .multilineTextAlignment(.center)
                  }.frame(width: 200.0)
                  .padding(8)
                                          .background(Color(.systemGray6))
                                          .cornerRadius(8)
                        
                  }.padding()
                  HStack(alignment: .top){
                      NavigationLink(destination: HomeSelectLocation()){
                      Image(systemName: "mappin.and.ellipse").foregroundColor(.black)
                      Text("San Francisco Bay Area")
                          .font(.footnote)
                          .fontWeight(.medium)
                          .foregroundColor(Color.blue)
                      }}.padding(.bottom, 10.0)
              List {
                  ForEach(event) { section in
                      Section(header: Text(section.name)) {
                          ForEach(section.items) { item in
                              NavigationLink(destination: EventDetail(item: item)) {
                                 EventRow(item: item)
                              }
                          }
                      }
                  }
              }
                  
              }.frame(maxWidth: .infinity)
              .navigationTitle("Events")
              
              
          }
      }
  }

  struct MainView_Previews: PreviewProvider {
      static var previews: some View {
          MainView()
      }
  }
