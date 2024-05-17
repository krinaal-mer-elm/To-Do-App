//
//  To_Do_AppApp.swift
//  To-Do App
//
//  Created by elluminati on 14/05/24.
//

import SwiftUI

@main
struct To_Do_AppApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
             ListView()
            }
            .environmentObject(listViewModel)
            
        }
    }
}
