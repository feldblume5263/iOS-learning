//
//  swiftUI_tutorialApp.swift
//  swiftUI_tutorial
//
//  Created by Junhong Park on 2021/11/05.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
