//
//  MeView.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 11/2/25.
//
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAdress") private var emailAdress = "you@yoursite.com"
    @State private var qrCode = UIImage()
    // motor de procesamiento de imagenes de Core Image
    let context = CIContext()
    // filtro que genera códigos QR
    let filter = CIFilter.qrCodeGenerator()
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                // .textContentType da pistas al sistema sobre el tipo de datos ingresados
                    .textContentType(.name)
                    .font(.title)
                TextField("Email address", text: $emailAdress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                // El usuario al mantener presionada la imagen, muestra la opción de compartir el código QR
                    .contextMenu {
                        ShareLink(item: Image(uiImage: qrCode), preview: SharePreview("My QR Code",image: Image(uiImage: qrCode)))
                        
                    }
                
            }
            .navigationTitle("Your Code")
            .onAppear(perform: updateCode)
            .onChange(of: name, updateCode)
            // Detecta los cambios y regenera el código QR en tiempo real.
            .onChange(of: emailAdress, updateCode)
        }
    }
    // Función para actualizar el código QR cuando cambia el nombre ó correo
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAdress)")
        
    }
    // Función para generar código QR
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                
                return  UIImage(cgImage: cgImage)
                
                
            }
        
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MeView()
}
