//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Furqan on 21/06/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game=EmojiMemoryGame() // An Object referring to class
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel:game)
        }
    }
}
