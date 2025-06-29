//
//  MemorizeAppApp.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import SwiftUI

@main
struct MemorizeAppApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .onChange(of: scenePhase) { newPhase in
                        switch newPhase {
                        case .active:
                            print("Event: app_foregrounded")
                        case .inactive:
                            print("Event: app_inactive")
                        case .background:
                            print("Event: app_backgrounded")
                       @unknown default:
                            break
                        }
                    }
            }
        }
    }
}
