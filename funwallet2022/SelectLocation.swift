//
//  Select Location.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/22/22.
//

import SwiftUI

struct SelectLocation: View {

        @State private var searchText = ""
    let cities = ["San Francisco Bay Area", "New York City", "Greater Los Angeles","Metro Atlanta"]
            var body: some View {
                NavigationView {
                    
                    List() {
                        ForEach(searchResults, id: \.self) { city in NavigationLink(destination: Preferences()) {
                            Text(city)
                            }
                        }
                    }

                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)){
                        ForEach(searchResults, id: \.self) {
                            result in
                            Text("\(result)").searchCompletion(result)
                                        }
                                    
                    }
                    .navigationTitle("Select Location")
                }
                
            }

            
    var searchResults: [String] {
                if searchText.isEmpty {
                    return cities
                } else {
                    return cities.filter { $0.contains(searchText) }
                }
            }
        }

struct SelectLocation_Previews: PreviewProvider {
    static var previews: some View {
        SelectLocation()
    }
}
