//
//  LobbyListView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/29/23.
//

import SwiftUI

struct LobbyView: View {
    
    let color1 = Color(red: 0.894, green: 0.91, blue: 0.937)
    let color2 = Color(red: 0.051, green: 0.439, blue: 0.761)
    let color3 = Color(red: 0.596, green: 0.769, blue: 0.906)
    
    var body: some View {
        NavigationStack{
            HStack{
                Spacer()
                
                NavigationLink {
                    CreateLobbyView()
                } label: {
                    newLobbyButton
                }
            }
        
        scrollView
            .navigationTitle("Lobbies")
            .toolbarBackground(color3, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private var newLobbyButton: some View {
        HStack (spacing: 4) {
            Text("New lobby")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundStyle(.black)
            Image(systemName: "plus")
                .foregroundStyle(.black)
        }
        .frame(width: 150, height: 32)
        .background(Color(white: 0.90))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.top, 24)
        .padding(.trailing, 24)
    }
    
    private var scrollView: some View {
        ScrollView {
            VStack (spacing: 24) {
                ForEach(lobbies, id: \.self) { lobby in // TODO: network integration
                    lobbyScrollViewCell(lobby)
                }
                .padding(16)
                .background(color1)
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
                        .frame(width: 64, height: 28)
                        .foregroundStyle(.white)
                        .background(color2)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            
            
            HStack {
                Image(systemName: "location.fill")
                Text(lobby.location)
                    .italic()
                
                Spacer()
                
                Text("\(lobby.currentPeople.count)/\(lobby.maxPeople)")
                Image(systemName: "person.fill")
            }
        }
    }
}

#Preview {
    LobbyView()
}
