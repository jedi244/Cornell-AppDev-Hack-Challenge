//
//  ContentView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Forum") // TODO: change
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Forum")
                }
            LobbyView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Lobbies")
                }
            Text("My Profile") // TODO: change
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("My Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}
