//
//  QRCodeView.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var qrCodeImage: UIImage? {
        let data = "Your data here".data(using: .ascii)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
        
        return nil
    }
    
    var body: some View {
        if let qrCodeImage = qrCodeImage {
            Image(uiImage: qrCodeImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
        } else {
            Text("QR Code Generation Failed")
        }
    }
}

#Preview {
    QRCodeView()
}




