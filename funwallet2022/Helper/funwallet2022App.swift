//
//  funwallet2022App.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/21/22.
//

import SwiftUI

@main
struct funwallet2022App: App {
    @StateObject var add = Wish()
    
    var body: some Scene {
        WindowGroup {
            Home().environmentObject(add)
        }
    }
}

