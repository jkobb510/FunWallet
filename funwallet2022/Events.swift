//
//  Events.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/24/22.
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
    var host: String
    var price: Int
    var restrictions: [String]
    var description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let example = EventItem(id: UUID(), name: "Golden Gate Bridge", host: "Joseph G.", price: 6, restrictions: ["G", "V"], description: "Enjoy a guided tour of the famous Golden Gate Bridge. The Frommer\'s travel guide describes the Golden Gate Bridge as possibly the most beautiful, certainly the most photographed, bridge in the world.")
    #endif
}
