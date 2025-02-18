//
//  Prospect.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 12/2/25.
//

import SwiftData


@Model

class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool

    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
    
    
    
}
