//
//  LobbyListView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/29/23.
//

import SwiftUI

struct LobbyView: View {
    
    var body: some View {
        setupView
    }
    
    private var setupView: some View {
        NavigationStack {
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Hello")
                } label: {
                    HStack (spacing: 4) {
                        Text("New lobby")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    }
                }
                .frame(width: 150, height: 32)
                .background(Color(white: 0.90))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.top, 24)
                .padding(.trailing, 24)
            }
            
            scrollView
                .navigationTitle("Lobbies")
                .toolbarBackground(Color(red: 0.596, green: 0.769, blue: 0.906), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            VStack (spacing: 24) {
                ForEach(lobbies, id: \.self) { lobby in
                    lobbyScrollViewCell(lobby)
                }
                .padding(16)
                .background(Color(white: 0.90))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding(24)
        .padding(.top, -8)
    }
    
    private func lobbyScrollViewCell(_ lobby: Lobby) -> some View {
        VStack (alignment: .leading) {
            
            HStack {
                Text(lobby.course)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink {
                    Text("Hello")
                } label: {
                    Text("Join")
                        .padding(4)
                        .frame(width: 64, height: 24)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }
            
            
            HStack {
                Image(systemName: "location.fill")
                Text(lobby.location)
                    .italic()
                
                Spacer()
                
                Text("\(lobby.currentPeople)/\(lobby.maxPeople)")
                Image(systemName: "person.fill")
            }
        }
    }
}

#Preview {
    LobbyView()
}
