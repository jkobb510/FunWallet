//
//  FirebaseManager.swift
//  FunWallet-iOS
//
//  Created by Seung (Jacob) Lee on 1/31/22.
//
import Firebase
import SwiftUI
import FirebaseFirestore
class FirebaseManager: NSObject {

    let auth: Auth
    let storage: Storage
    let firestore: Firestore

    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()

        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()

        super.init()
    }

}
