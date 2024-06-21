//
//  Contact.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var dateMet: Date
    var placeMet: String
    var job: String
    var description: String
    var email: String?
    var phoneNumber: String?
    var address: String?
    var socialMedia: [String]?

    enum Keys: String, CaseIterable {
        case name, surname, dateMet, placeMet, job, description, email, phoneNumber, address, socialMedia
    }
}

