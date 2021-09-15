//
//  ContentView.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 9/11/21.
//

import SwiftUI
import MapKit


struct ContentView: View {
    
    let cities = [
        "San Francisco Bay Area, CA",
        "Greater Los Angeles, CA",
        "Atlanta Metropolitan Area, GA",
        "New York City, NY",
        "",
        "",
        "",
        "",
        "",        "",
        "",
        "",
        "",
        "",


        
    ]
    
    @State var searchText = ""
    @State var searching = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                SearchView(searchText: $searchText, searching: $searching).padding()
                List {
                    ForEach(cities.filter({
                        
                        
                        (theCity: String) -> Bool in
                        return theCity.hasPrefix(searchText) || searchText == ""
                    }), id: \.self) { city in
                        Text(city)
                    }
                }
                .gesture(DragGesture()
                            
                            .onChanged({ _ in
                                UIApplication.shared.dismissKeyboard()
                            })
                )
                .listStyle(GroupedListStyle())
                .navigationTitle("Select Your Location")
                .toolbar {
                    if searching {
                        Button("Cancel") {
                            searchText = ""
                            withAnimation {
                                searching = false
                                UIApplication.shared.dismissKeyboard()
                            }
                        }
                    }
                }
            }
        }
    }

}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
