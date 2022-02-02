//
//  FunWallet_iOSApp.swift
//  FunWallet-iOS
//
//  Created by Seung (Jacob) Lee on 1/31/22.
//

import SwiftUI

@main
struct FunWallet_iOSApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                            
                OnboardingContainerView()
                        } else {
                           
                LoginView()
                        }
                    }
                }
            }
