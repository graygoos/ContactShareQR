//
//  ScanQRCodeView.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI
import CodeScanner

struct ScanQRCodeView: View {
    @Binding var scannedContact: Contact?
    @Binding var userProfile: UserProfile
    @Binding var isPresented: Bool

    var body: some View {
        CodeScannerView(
            codeTypes: [.qr],
            simulatedData: "Sample QR Code",
            completion: handleScan
        )
    }

    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let scanResult):
            // Parse the scanned code and create a Contact object
            let contact = parseQRCode(scanResult.string)
            scannedContact = contact
            isPresented = false
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
            isPresented = false
        }
    }

    func parseQRCode(_ code: String) -> Contact {
        // Implement the logic to parse the QR code string and create a Contact object
        return Contact(
            name: "Parsed Name",
            surname: "Parsed Surname",
            dateMet: Date(),
            placeMet: "Parsed Place",
            job: "Parsed Job",
            description: "Parsed Description"
            // Fill in other properties as needed
        )
    }
}

#Preview {
    ScanQRCodeView(scannedContact: .constant(nil), userProfile: .constant(UserProfile()), isPresented: .constant(true))
}




