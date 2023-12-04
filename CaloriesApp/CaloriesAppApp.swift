//
//  CaloriesAppApp.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

@main
struct CaloriesAppApp: App {
    @StateObject var viewModel: CDDataModel = CDDataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CDDataModel())
        }
    }
}
