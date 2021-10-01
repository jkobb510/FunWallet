//
//  PresenterManager.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/12/21.
//

import UIKit

class PresenterManager {
    static let shared=PresenterManager()
    private init(){}
    enum VC {
        case mainTabBarController
        case onboarding
    }
    func show(vc: VC){
        var viewController: UIViewController
        
        switch vc {
        case .mainTabBarController:
             viewController = UIStoryboard(name: K.StoryBoardID.main, bundle: nil).instantiateViewController(identifier: K.StoryBoardID.mainTabBarController)
        case .onboarding:
            viewController = UIStoryboard(name: K.StoryBoardID.main, bundle: nil).instantiateViewController(identifier: K.StoryBoardID.onboardingViewController)
        }

        
    if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
       let window = sceneDelegate.window {
            window.rootViewController = viewController
            
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
           }

}
}
