//
//  Project_1_SimpleUseSwiftUIApp.swift
//  Project_1_SimpleUseSwiftUI
//
//  Created by Maksym Poskannyi on 27.05.2025.
//

import SwiftUI

@main
struct Project_1_SimpleUseSwiftUIApp: App {
    // 1) Создаём единственный объект состояния
       @StateObject private var settings = Settings()

       var body: some Scene {
           WindowGroup {
               // 2) Здесь рендерится «корневой» View
               RootView()
                   // 3) Прокидываем settings всем вложенным View
                   .environmentObject(settings)
           }
       }
}

struct RootView: View {
    var body: some View {
        HStack(spacing: 0) {
            AsidePanel()
                .frame(width: 200)      // фиксированная ширина панели

            Divider()                   // разделитель

            MainView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
