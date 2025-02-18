//
//  ContentView.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 7/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Tab para mostrar distintas vistas
        TabView {
            Tab("Everyone", systemImage: "person.3") {
                ProspectsView(filter: .none)
            }
            Tab("Contacted", systemImage:"checkmark.circle") {
                ProspectsView(filter: .contacted)
            }
            Tab("Uncontacted", systemImage: "questionmark.diamond") {
                ProspectsView(filter: .uncontacted)
            }
            Tab("Me", systemImage: "person.crop.square") {
                MeView()
            }
            
        }
        
    }
   
}


#Preview {
    ContentView()
}
