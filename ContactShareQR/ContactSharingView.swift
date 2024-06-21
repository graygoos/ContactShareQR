//
//  ContactSharingView.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI

enum ContactKeys: String, CaseIterable, Hashable {
    case name, surname, job, placeMet, dateMet, email, phoneNumber, address, socialMedia, description
}

struct ContactSharingView: View {
    @Binding var contact: Contact
    @Binding var sharedDetails: [ContactKeys: Bool]

    var body: some View {
        VStack {
            ForEach(ContactKeys.allCases, id: \.self) { key in
                HStack {
                    Text(key.rawValue.capitalized)
                    Spacer()
                    Toggle(isOn: Binding(
                        get: { sharedDetails[key, default: true] },
                        set: { sharedDetails[key] = $0 }
                    )) {
                        Text("")
                    }
                }
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    ContactSharingView(
        contact: .constant(Contact(
            name: "John",
            surname: "Doe",
            dateMet: Date(),
            placeMet: "San Francisco, CA",
            job: "Software Developer",
            description: "Met at a networking event, useful for mobile app development",
            email: "john.doe@example.com",
            phoneNumber: "123-456-7890",
            address: "123 Main St, San Francisco, CA",
            socialMedia: ["Twitter: @johndoe", "LinkedIn: /in/johndoe"]
        )),
        sharedDetails: .constant([:])
    )
}

