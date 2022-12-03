//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by macOs on 3/12/2022.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
