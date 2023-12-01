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
    
    // MARK: body
    var body: some View {
        NavigationStack {
            ZStack {
                Color(color3)
                    .ignoresSafeArea()
                
                loginView
            }
        }
    }
    
    // MARK: Views
    private var loginView: some View {
        VStack {
            Spacer()
                    .frame(height: 48)
            
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            TextField("Username", text: $username)
                .padding(24)
                .frame(height: 48)
                .background(.black.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .border(.red, width: CGFloat(wrongUsername))
            
            Spacer()
                    .frame(height: 16)
            
            SecureField("Password", text: $password)
                .padding(24)
                .frame(height: 48)
                .background(.black.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .border(.red, width: CGFloat(wrongPassword))
            
            Spacer()
                    .frame(height: 16)
            
            Button("Login") {
                authenticateUser(username: self.username, password: self.password)
            }
            .padding(24)
            .foregroundStyle(.white)
            .frame(width: 150, height: 48)
            .background(color2)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .navigationDestination(isPresented: $showingLoginScreen) {
                tabView
                    .navigationTitle("Forum")
                    .navigationBarTitleDisplayMode(.large)
            }
            
            Spacer()
        }
        .padding(24)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(24)
    }
    
    private var tabView: some View {
        TabView(selection: $currentTab) {
            ForumView()
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
    
    // MARK: button helpers
    func authenticateUser(username: String, password: String) {
        if username == "Jedi" {
            wrongUsername = 0
            if password == "1234" {
                wrongPassword = 0
                showingLoginScreen = true
            } 
            else {
                wrongPassword = 1
            }
        }
        else {
            wrongUsername = 1
        }
    }
}

#Preview {
    ContentView()
}

