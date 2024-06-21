//
//  ContactDetailView.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: Contact
    
    var body: some View {
        VStack {
            Text("\(contact.name) \(contact.surname)")
                .font(.largeTitle)
            Text(contact.job)
                .font(.title)
            Text(contact.placeMet)
                .font(.subheadline)
            
            if let email = contact.email {
                Text("Email: \(email)")
            }
            if let phoneNumber = contact.phoneNumber {
                Text("Phone: \(phoneNumber)")
            }
            if let address = contact.address {
                Text("Address: \(address)")
            }
            if let socialMedia = contact.socialMedia {
                ForEach(socialMedia, id: \.self) { media in
                    Text("Social Media: \(media)")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContactDetailView(contact: Contact(
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
    ))
}
