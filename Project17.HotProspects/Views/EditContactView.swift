//
//  EditContactView.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 18/2/25.
//

import SwiftUI

struct EditContactView: View {
    @Bindable var prospectsSample: Prospect
    var body: some View {
        Form {
                TextField("Name", text: $prospectsSample.name)
                TextField("Email", text: $prospectsSample.emailAddress)
            }
        .navigationTitle("Edit Prospect")
    }
      
}

#Preview {
    EditContactView(prospectsSample:( Prospect(name:"John Doe", emailAddress:"john@example.com", isContacted: false)))
}
