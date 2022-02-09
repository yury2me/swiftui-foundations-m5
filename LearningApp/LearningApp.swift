//
//  LearningApp.swift
//  LearningApp
//
//  Created by Iúri Sanchez Fidalgo Amaral Tomé on 09/02/2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
				.environmentObject(ContentModel())
        }
    }
}
