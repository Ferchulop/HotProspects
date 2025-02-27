//
//  Prospect.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 12/2/25.
//

import SwiftData
import Foundation

@Model

class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var createdAt: Date = Date.now
    

    init(name: String, emailAddress: String, isContacted: Bool, createdAt: Date = Date.now) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.createdAt = createdAt
        
    }
  
    
}
