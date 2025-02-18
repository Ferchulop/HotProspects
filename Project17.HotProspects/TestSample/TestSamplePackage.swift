//
//  TestSamplePackage.swift
//  Project17.HotProspects
//
//  Created by Fernando Jurado on 11/2/25.
//
import SamplePackage
import SwiftUI

struct TestSamplePackage: View {
    let possibleNumbers = 1...60
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    var body: some View {
        Text(results)
    }
}

#Preview {
    TestSamplePackage()
}
