//
//  GloryCasinoApp.swift
//

import SwiftUI

@main
struct GloryCasinoApp: App {
    
    @StateObject var vm = GameLogic()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(vm)
        }
    }
}
