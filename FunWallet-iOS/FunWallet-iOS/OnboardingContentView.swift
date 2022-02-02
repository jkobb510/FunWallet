//
//  Onboarding.swift
//  FunWallet-iOS
//
//  Created by Seung (Jacob) Lee on 1/31/22.
//

import SwiftUI

let features = [
    Feature(title: "Welcome to FunWallet", subtitle: "Turn dating into an adventure by discovering hosted events near you", image: "pic1"),
          
    Feature(title: "Makes Dating Easier", subtitle: "Send invitations, see curated results, and have new experiences", image: "pic2"),
                    
    Feature(title: "Host your own events", subtitle: "Bring the same experience to others by hosting for others", image: "Image3")
]

struct OnboardingContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    var feature: Feature
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                       VStack {

                         

            Image(feature.image)
                .resizable()
                .scaledToFit()
                     
                           Image("smallicon").padding(.top)
                            
                           
                VStack(spacing: 20) {
                                Text(feature.title)
                        .font(.system(size: 25, weight: .bold))                                        .foregroundColor(.white)

                                Text(feature.subtitle)
                                    .font(.body)    .foregroundColor(.white)

                            }
                            .padding()
                            
                            
                            Button(action: {
                                isOnboarding = false }, label: {
                                    Text("Get Started")
                                        .foregroundColor(.white)
                                        .padding()
                                    .background(
                                        Capsule()
                                            .strokeBorder(Color.white, lineWidth: 1.5)
                                            .frame(width: 200))

                            })
                            
                            Spacer()
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
}





struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView(feature: features[0])
    }
}
