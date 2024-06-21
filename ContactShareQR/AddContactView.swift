//
//  AddContactView.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI
import CodeScanner

struct AddContactView: View {
    @State private var qrCodeImage: UIImage? = nil
    @State private var showScanQRView = false
    @State private var scannedContact: Contact? = nil
    @State private var userProfile = UserProfile()

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Menu action
                }) {
                    Image(systemName: "line.horizontal.3")
                }
                .padding()
                Spacer()
                Button(action: {
                    // Search action
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .padding()
            }

            if let qrCodeImage = qrCodeImage {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
            }

            Spacer()

            QRCodeView()

            HStack {
                Button(action: {
                    // Share action
                }) {
                    Text("Share")
                }
                Button(action: {
                    // Copy link action
                }) {
                    Text("Copy Link")
                }
                Button(action: {
                    // Download action
                }) {
                    Text("Download")
                }
            }
            .padding()

            Spacer()

            Button(action: {
                // Add contact action
                showScanQRView.toggle()
            }) {
                Text("Add Contact")
                    .font(.title)
                    .padding()
            }
            .sheet(isPresented: $showScanQRView) {
                ScanQRCodeView(scannedContact: $scannedContact, userProfile: $userProfile, isPresented: $showScanQRView)
            }

            if let scannedContact = scannedContact {
                Text("Scanned Contact: \(scannedContact.name) \(scannedContact.surname)")
                    .padding()
            }
        }
    }
}

#Preview {
    AddContactView()
}




