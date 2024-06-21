//
//  ContactShareQRApp.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI

@main
struct ContactShareQRApp: App {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                UserProfileSetupView(isFirstLaunch: $isFirstLaunch)
            } else {
                HomeScreen()
            }
        }
    }
}
