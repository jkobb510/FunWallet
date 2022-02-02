//
//  SwiftUIView.swift
//  FW-App
//
//  Created by Seung (Jacob) Lee on 1/30/22.
//

import SwiftUI

struct MainView: View {
    let event = Bundle.main.decode([EventSection].self, from: "events.json")


      var body: some View {
          NavigationView {
              VStack{
              NavigationLink(destination: HomeSelectLocation()){
                  HStack (spacing: 5) {
                              Image(systemName: "magnifyingglass")
                              Text("Search For Events")
                                  .font(.body)
                                  .foregroundColor(Color.gray)
                                  .multilineTextAlignment(.center)
                              }.padding(8)
                                  .background(Color(.systemGray6))
                                  .cornerRadius(8)
                              
                          }
                             
                                  
                    /*        HStack {
                              Image(systemName: "mappin.and.ellipse").foregroundColor(.black)
                              Text("San Francisco Bay Area")
                                  .font(.footnote)
                                  .fontWeight(.medium)
                                  .foregroundColor(Color.blue)
                            
                              
                          }*/
          List {
              ForEach(event) {
                    section in
                      Section(header: Text(section.name)
                      ) {
                          
                        ForEach(section.items) { item in
                NavigationLink(destination: EventDetail(item: item)) {
                    EventRow(item: item)
                              }
                          }
                      }
                  }
          }
              }
          .navigationTitle("Explore")
              .listStyle(GroupedListStyle())
                  

      }
      }
              
}
      
                                
   struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
       
   }
    
