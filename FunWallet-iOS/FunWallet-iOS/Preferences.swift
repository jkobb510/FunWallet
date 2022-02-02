//
//  Preferences.swift
//  FW-App
//
//  Created by Seung (Jacob) Lee on 1/30/22.
//

import SwiftUI

struct Preferences: View {
    @State var Amount: String = ""
    @State var presentAlert = false

    var body: some View {
        
            VStack{
                Text("How much would you like to spend on each date?")
                HStack{
                    Text ("$")
                    TextField("0-100", text: $Amount) .background(.white).padding(.all, 12).background(.white)
                    
                }
                
                   
            
                Text("Next").fontWeight(.semibold).foregroundColor(.white).frame(maxWidth: 90, minHeight: 40).background(.yellow)
            
        }.padding([.leading, .trailing])

        
    }
}



