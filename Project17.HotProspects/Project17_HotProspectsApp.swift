//
//  Project17_HotProspectsApp.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 7/2/25.
//
import SwiftData
import SwiftUI

@main
struct Project17_HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
