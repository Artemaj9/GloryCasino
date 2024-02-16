//
//  GloryCasinoApp.swift
//  GloryCasino
//
//  Created by Artem on 11.02.2024.
//

import SwiftUI

@main
struct GloryCasinoApp: App {
    
    @StateObject var vm = GameLogic()
    var body: some Scene {
        WindowGroup {
            EarthWin()
                .environmentObject(vm)
        }
    }
}
