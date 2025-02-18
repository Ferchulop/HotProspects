//
//  ContextMenu.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 10/2/25.
//

import SwiftUI

struct ContextMenu: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
                .background(backgroundColor)
            Text("Change Color")
                .padding()
            // Despliega un submenu con distintas opciones para cambiar background del texto "Hello World"
                .contextMenu {
                    Button("Red") {
                        backgroundColor = .red
                    }
                    Button("Blue") {
                        backgroundColor = .blue
                        
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                        
                    }
                    
                    
                }
            
            
        }
    }
}

#Preview {
    ContextMenu()
}
