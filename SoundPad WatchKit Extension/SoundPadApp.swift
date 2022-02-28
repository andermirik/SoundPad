//
//  SoundPadApp.swift
//  SoundPad WatchKit Extension
//
//  Created by Огурцов Андрей on 10.02.2022.
//

import SwiftUI

@main
struct SoundPadApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
