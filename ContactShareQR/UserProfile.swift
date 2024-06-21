//
//  UserProfile.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import Foundation
import SwiftUI

class UserProfile: ObservableObject {
    @Published var profileImage: UIImage? = nil
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var job: String = ""
    @Published var city: String = ""
    @Published var nation: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var address: String = ""
    @Published var bio: String = ""
    @Published var socialMedia: [String] = ["", "", "", "", ""]
}
