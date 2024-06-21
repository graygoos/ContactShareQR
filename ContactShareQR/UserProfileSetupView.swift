//
//  UserProfileSetupView.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI

struct UserProfileSetupView: View {
    @Binding var isFirstLaunch: Bool
    @StateObject private var userProfile = UserProfile()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if let profileImage = userProfile.profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding()
                    }

                    Button(action: {
                        // Add action to upload profile image
                    }) {
                        Text("Upload Profile Image")
                    }
                    .padding()

                    TextField("Name", text: $userProfile.name)
                        .padding()
                    TextField("Surname", text: $userProfile.surname)
                        .padding()
                    TextField("Job", text: $userProfile.job)
                        .padding()
                    TextField("City", text: $userProfile.city)
                        .padding()
                    TextField("Nation", text: $userProfile.nation)
                        .padding()
                    TextField("Email", text: $userProfile.email)
                        .padding()
                    TextField("Phone", text: $userProfile.phone)
                        .padding()
                    TextField("Address", text: $userProfile.address)
                        .padding()
                    TextField("Bio", text: $userProfile.bio)
                        .padding()

                    ForEach(0..<5, id: \.self) { index in
                        TextField("Social Media \(index + 1)", text: $userProfile.socialMedia[index])
                            .padding()
                    }

                    Spacer()

                    Button(action: {
                        // Save user profile action
                        isFirstLaunch = false
                    }) {
                        Text("Save")
                            .font(.title)
                            .padding()
                    }
                }
                .navigationTitle("Setup Profile")
            .padding()
            }
        }
    }
}


#Preview {
    UserProfileSetupView(isFirstLaunch: .constant(true))
}
