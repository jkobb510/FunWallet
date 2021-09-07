//
//  Helper.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/10/21.
//

import UIKit

func delay (durationInSeconds seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter (deadline: .now() + seconds, execute: completion)
}

