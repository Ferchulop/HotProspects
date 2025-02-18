//
//  UseOfResult.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 9/2/25.
//

import SwiftUI
// Este código usa Result para manejar errores de forma explícita y segura
struct UseOfResult: View {
    @State private var output = ""
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
        
        
        
    }
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data,_) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
            
        }
        /* Se espera el resultado de Task, el cual puede ser un .success(String) - La solicitud se completó correctamente ó failure(Error) - Hubo un error en la solicitud o procesamiento de los datos. Result es un enum que fuerza a manejar el exito o el fallo de manera explícita. Evita el uso de try/catch, haciendo el código más seguro y accesible */
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
            
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
            
        }
    }
}

#Preview {
    UseOfResult()
}
