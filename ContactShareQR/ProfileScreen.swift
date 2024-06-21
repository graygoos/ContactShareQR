//
//  ProfileScreen.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var profile = UserProfile()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        // Menu action
                    }) {
                        Image(systemName: "line.horizontal.3")
                    }
                    .padding()
                    Spacer()
                }
                
                if let profileImage = profile.profileImage { // Use profile.profileImage instead of $profile.profileImage
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()
                }
                
                TextField("Name", text: $profile.name)
                    .padding()
                TextField("Surname", text: $profile.surname)
                    .padding()
                TextField("Job", text: $profile.job)
                    .padding()
                TextField("City", text: $profile.city)
                    .padding()
                TextField("Nation", text: $profile.nation)
                    .padding()
                TextField("Email", text: $profile.email)
                    .padding()
                TextField("Phone", text: $profile.phone)
                    .padding()
                TextField("Address", text: $profile.address)
                    .padding()
                TextField("Bio", text: $profile.bio)
                    .padding()
                
                ForEach(0..<5, id: \.self) { index in
                    TextField("Social Media \(index + 1)", text: $profile.socialMedia[index])
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
    
#Preview {
    ProfileScreen()
}


