//
//  MultipleTabs.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 8/2/25.
//

import SwiftUI

struct MultipleTabs: View {
    enum Tabs {
        case Contraseñas,Localizaciones,FriendZone,Compras
        
    }
    @State private var selectedTab: Tabs = .Contraseñas
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Contraseñas", systemImage: "calendar", value: .Contraseñas) {
                Button("Show Tab 1 ") {
                    selectedTab = .FriendZone
                }
                
            }
           
            Tab("Locations", systemImage:"list.bullet", value: .Localizaciones) {
                Text("Content for Tab 2")
            }
           
            Tab("Friendzone", systemImage: "newspaper", value: .FriendZone) {
                Text("No more data")
            }
            Tab("Compras", systemImage: "bell", value: .Compras) {
                ContentView()
            }
            .badge("0")
        }
        .tint(.green)
    
        
    }
}

#Preview {
    MultipleTabs()
}
