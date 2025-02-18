//
//  ImageInterpolation.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 9/2/25.
//

import SwiftUI
// Útil para:
// Imágenes pixel-art (donde mantener bordes nítidos).
// Evitar el suavizado borroso en imágenes de baja resolución.
struct ImageInterpolation: View {
    var body: some View {
        Image(.example)
            .interpolation(.none) // Controla como se suavizan ó procesan los píxeles al cambiar el tamaño de una imagen
            .resizable()
            .scaledToFit()
            .background(.black)
        
    }
}

#Preview {
    ImageInterpolation()
}
