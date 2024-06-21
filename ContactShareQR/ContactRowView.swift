//
//  ContactRowView.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI

struct ContactRowView: View {
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(contact.name) \(contact.surname)")
                .font(.headline)
            Text(contact.dateMet, style: .date)
            Text(contact.placeMet)
            Text(contact.job)
            Text(contact.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}


#Preview {
    ContactRowView(contact: Contact(
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
