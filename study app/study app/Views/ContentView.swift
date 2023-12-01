//
//  ContentView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/23/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    @State var username: String = ""
    @State private var password: String = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen: Bool = false
    @State var currentTab: String = ""
    
    let color1 = Color(red: 0.894, green: 0.910, blue: 0.937)
    let color2 = Color(red: 0.051, green: 0.439, blue: 0.761)
    let color3 = Color(red: 0.596, green: 0.769, blue: 0.906)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
            }
            
            tabView
                .navigationTitle("Forum")
                .toolbarBackground(color3, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private var tabView: some View {
        TabView(selection: $currentTab) {
            Text("Forum") // TODO: change
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Forum")
                }.tag("Forum")
            LobbyView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Lobbies")
                }.tag("Lobbies")
            Text("My Profile") // TODO: change
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("My Profile")
                }.tag("Profile")
        }
        .navigationTitle($currentTab)
        .toolbarBackground(color3, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
