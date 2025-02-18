//
//  CustomRow.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 11/2/25.
//

import SwiftUI

struct CustomRow: View {
    var body: some View {
        List {
            Text("Henry MacLeod")
            // Desliza el texto hacia izq o derecha  y configura la característica que desees como borrar o fijar una accion
                .swipeActions {
                    
                    Button("Delete",systemImage: "minus.circle", role: .destructive) {
                        print("Delete")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
                }
            
        }
    }


#Preview {
    CustomRow()
}
