//
//  HomeView.swift
//  FW-App
//
//  Created by Seung (Jacob) Lee on 1/30/22.
//

import SwiftUI



    
class Wish: ObservableObject {
    @Published var items = [EventItem]()

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func add(item: EventItem) {
        items.append(item)
    }

    func remove(item: EventItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
