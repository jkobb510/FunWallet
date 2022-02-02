//
//  SwiftUIView.swift
//  FW-App
//
//  Created by Seung (Jacob) Lee on 1/30/22.
//

import SwiftUI

struct HomeSelectLocation: View {
 @State private var searchText = ""
                                    
let cities = ["San Francisco Bay Area", "New York City", "Greater Los Angeles","Metro Atlanta"]
     var body: some View {
                                                
                            List() {
                            ForEach(searchResults, id: \.self) { city in NavigationLink(destination: Text(city)) {
                                                        Text(city)
                                                        }
                                                    }
                                                }

                                                
                            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), suggestions:{
                                                    
                                                    
                                ForEach(searchResults, id: \.self) {
                                                     
                                    suggestion in
                                                      
                                    Text("\(suggestion)").searchCompletion(suggestion)
                                                                    }
                                                                
                                                })
                                                    
                                                
                                               
                            .navigationTitle("Select Location")
                                       
                                            
                                            
                                        }

                                        
                                var searchResults: [String] {
                                            if searchText.isEmpty {
                                                return cities
                                            } else {
                                                return cities.filter { $0.contains(searchText) }
                                            }
                                        }
                                    }
                               
