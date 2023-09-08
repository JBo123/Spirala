//
//  SpiralaApp.swift
//  Spirala
//
//  Created by Jakub Klucký on 08.09.2023.
//

import SwiftUI

@main
struct SpiralaApp: App {
    var body: some Scene {
        WindowGroup {
            DrwaingView(valueA: .constant("1"), valueN: .constant("1"))
            //ContentView(valueA: "", valueN: "")
        }
    }
}
