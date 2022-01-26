//
//  EventItem.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/24/22.
//

import SwiftUI

struct EventRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    let item: EventItem

    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .border(.gray)

            VStack(alignment: .leading) {
                
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")

            }

            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(item: EventItem.example)
    }
}
