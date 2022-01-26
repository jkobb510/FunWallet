//
//  SearchView.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/23/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("SearchBar"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ...", text: $searchText) { startedSearching in
                    if startedSearching {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
            
                        searching = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding()
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""), searching: .constant(false))
    }
}
