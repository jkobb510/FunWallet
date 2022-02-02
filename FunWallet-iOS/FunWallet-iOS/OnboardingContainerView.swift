//
//  OnboardingContainerView.swift
//  FunWallet-iOS
//
//  Created by Seung (Jacob) Lee on 1/31/22.
//
import SwiftUI

struct OnboardingContainerView: View {
    var body: some View {
        TabView {
            ForEach(features) { feature in
                OnboardingContentView(feature: feature)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView()
    }
}
