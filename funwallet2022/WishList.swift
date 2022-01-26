//
//  WishLift.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/24/22.
//

import SwiftUI

struct WishList: View {
    @EnvironmentObject var wish: Wish

    var body: some View {
        NavigationView{
        List {
                        Section {
                            ForEach(wish.items) { item in
                                HStack {
                                    Text(item.name)
                                    Spacer()
                                    Text("$\(item.price)")
                                }
                            }
                            .onDelete(perform: deleteItems)
                        }
                        Section {
                               NavigationLink(destination: MainView()) {
                                   Text("Add Events")
                               }
                           }
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
    


/*struct WishLift_Previews: PreviewProvider {
    static var previews: some View {
        WishList().environmentObject(Wish())
    }
}
*/
