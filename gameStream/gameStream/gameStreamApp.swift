//
//  gameStreamApp.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 13/02/23.
//

import SwiftUI

@main
struct gameStreamApp: App {
@Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }.onChange(of: scenePhase) { phase in
            print(phase)
        }
    }
}
