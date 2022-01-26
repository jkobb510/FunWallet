//
//  EventDetail.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/24/22.
//

import SwiftUI

struct EventDetail: View {
    @EnvironmentObject var wish: Wish
       let item: EventItem

       var body: some View {
           VStack {
                   Image(item.mainImage)
                       .resizable()
                       .scaledToFit()

                  
                  
               HStack{
                   Image(systemName: "star.fill")
                       .foregroundColor(Color.yellow)
                   Text("4.5")
                       .fontWeight(.semibold)
                   Spacer()
                   Text("Host: \(item.host)")
                       .fontWeight(.semibold)
                   
                   
                   

               }.padding()
               
               Text(item.description)
                   .padding([.leading, .bottom, .trailing])
               
               HStack{
               Button{
                   wish.add(item: item)
               } label: {
                   Image(systemName:"heart")
               }
                   Button ("Send Invite") {
                       
                   }
                   .padding(.leading, 12.0)
               }
               Spacer()
           }
           .navigationTitle(item.name)
           .navigationBarTitleDisplayMode(.inline)
       }
   }

   struct ItemDetail_Previews: PreviewProvider {
       static var previews: some View {
           Group {
               NavigationView {
                   EventDetail(item: EventItem.example)
                       .environmentObject(Wish())
               }
               NavigationView {
                   EventDetail(item: EventItem.example)
                       .environmentObject(Wish())
               }
           }
       }
   }
