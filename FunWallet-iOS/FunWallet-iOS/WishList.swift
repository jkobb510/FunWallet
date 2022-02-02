//
//  SwiftUIView.swift
//  FW-App
//
//  Created by Seung (Jacob) Lee on 1/30/22.
//

import SwiftUI

struct WishList: View {
    @EnvironmentObject var wish: Wish

    var body: some View {
        NavigationView {

        List {
                        
            Section {
            ForEach(wish.items) { item in
                                
                HStack {
                Text("\(item.name)")
                Spacer()
                 Text("$\(item.price)")
                                }
                            }
                .onDelete(perform: deleteItems)
                        }
            Section  {
                Text("Your Wish List Is empty.") +
                Text("\nAdd events by clicking the\n \"") +
                Text(Image(systemName: "heart")) +
                Text("\" in the event details")
            }.foregroundColor(.gray).padding()
            
            
            .disabled(wish.items.isEmpty)
            

                    }
                  
        .navigationTitle("Wish List")
            .listStyle(InsetGroupedListStyle())
          
    
        }
    }
        
    
    func deleteItems(at offsets: IndexSet) {
          wish.items.remove(atOffsets: offsets)
      }
}
