//
//  MultipleList.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 11/2/25.
//

import SwiftUI

struct MultipleList: View {
    let users = ["Yoku", "Jhen", "Yuri","Momiri"]
    @State private var selection = Set<String>()

    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        if selection.isEmpty == false  {
            // .formatted para mostrar You selected Momiri, en su defecto sería: You selected ["Momiri"]
            Text("You selected \(selection.formatted())")
        }
        EditButton() // Habilita posibilidad de desplegar multilista
    }
}

#Preview {
    MultipleList()
}
