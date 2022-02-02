//
//  HomeView.swift
//  FW-App
//
//  Created by Seung (Jacob) Lee on 1/30/22.
//

import SwiftUI




struct EventSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [EventItem]
}

struct EventItem: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var type: String
    var address: String
    var city: String
    var zip: Int
    var host: String
    var price: Int
    var restrictions: [String]
    var rating: String
    
    var description: String
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let example = EventItem(id: UUID(), name: "Golden Gate Bridge Tour", type: "Historic Landmark", address: "Golden Gate Bridge, San Francisco, CA", city: "San Francisco, CA", zip: 94941, host: "Joseph G.", price: 6, restrictions: ["G"], rating: "4.5", description: "Break the ice with a tour of the most iconic structure in San Francisco. The Golden Gate Bridge is one of the most photographed bridges in the world")
    #endif
}

struct EventRow: View {
    let item: EventItem
    var body: some View {
        
        
        VStack (alignment: .leading, spacing: 3){
                HStack (spacing: 5) {
                Text("\(item.name)")
                        .font(.subheadline).fontWeight(.semibold)
                }
            HStack (alignment: .top, spacing: 5) {
            Image(item.thumbnailImage)
                .border(.gray)
            
            
                    VStack(spacing: 1) {
            
                HStack(spacing: 3){
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Text("\(item.rating)")
                        .font(.subheadline)
                    signs(item: item)

                    Spacer()
                }
                HStack(spacing: 1){
                    Text("\(item.city)").font(.subheadline)
                    Spacer()
                }

                HStack (spacing: 1){
                    Text("From").font(.subheadline)
                    Text("$\(item.price)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text ("/ Person").font(.subheadline)
                    Spacer()
                }
                        HStack{
                            Text("\(item.type)").font(.subheadline)
                            Spacer()
                        }
                
                
            }
                
            }

        }
        
    }
}
struct EventDetail: View {
    @EnvironmentObject var wish: Wish

       let item: EventItem

       var body: some View {
           VStack {
           ZStack (alignment: .bottomTrailing) {
                   Image("\(item.mainImage)")
                       .resizable()
                       .scaledToFit()
               
               
           }
               VStack (alignment: .leading, spacing: 0) {
               HStack{
                   Text("\(item.name)")
                       .font(.body)
                       .fontWeight(.semibold)
                   Image(systemName: "star.fill").frame(maxWidth: 10, maxHeight: 10)
                       .foregroundColor(Color.yellow).padding( .bottom, 3.0).padding(.leading, 3)
                   Text("\(String(format: "%.1f", item.rating))")
                   
                   signs(item: item)

               }
                   
      
                   Text("\(item.city)").font(.subheadline)
                           
                   

                  
                   HStack (spacing: 3){
                      Text("Host: ").font(.subheadline)
                           
                       Text("\(item.host)")
                           .font(.subheadline)
                           .fontWeight(.medium)
                         
                   }

                   
               
                   Text("From $\(item.price) / person").font(.subheadline)
                           .fontWeight(.regular)
                   
                   
               Text(item.description)
                       .padding(.vertical, 5.0).font(.subheadline)
                   
                   HStack (alignment: .center) {
     
                   Button ("Send Invite") {
                       
                   }
                       
                   }.frame(maxWidth: .infinity).padding()
                   

               }.padding(.horizontal, 5.0)
           }
           .navigationBarTitleDisplayMode(.inline)
           
       }
    
}
   


   
struct signs: View {
    let item: EventItem
    let colors: [String: Color] = [ "G": .purple]

    var body: some View {
        ForEach(item.restrictions, id: \.self) { restriction in
            Text(restriction)
                .font(.caption)
                .fontWeight(.black)
            
                .frame(maxWidth: 17, maxHeight: 17)
                .background(colors[restriction, default: .black])
                .clipShape(Circle())
                .foregroundColor(.white)
        }
}
}
struct UserInfo: Identifiable {
    var id: String = UUID().uuidString
    var firstname: String
    var lastname: String
    var email: String
    var description: String
    var gender: String
    var age: Int
    var location: String
    var willingtospend: Int
}
