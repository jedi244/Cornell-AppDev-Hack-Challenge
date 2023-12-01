//
//  LobbyMemberView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/30/23.
//

import SwiftUI

struct LobbyMemberView: View {
    // MARK: Properties
    private var lobby: Lobby
    
    let color1 = Color(red: 0.894, green: 0.910, blue: 0.937)
    let color2 = Color(red: 0.051, green: 0.439, blue: 0.761)
    let color3 = Color(red: 0.596, green: 0.769, blue: 0.906)
    
    // MARK: init
    init(lobby: Lobby) {
        self.lobby = lobby
    }
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            VStack {
                lobbyDetails
                
                lobbyMembers
            }
            .navigationTitle("Current lobby")
            .toolbarBackground(color3, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(24)
            
        }
    }
    
    // MARK: Views
    private var lobbyDetails: some View {
        
        VStack (alignment: .leading, spacing: 12) {
            
            Text(lobby.course)
                .font(.title)
                .fontWeight(.bold)
            
            Text(lobby.description)
                .font(.title2)
                .fontWeight(.light)
                .foregroundStyle(.gray)
            
            HStack {
                Image(systemName: "location.fill")
                Text(lobby.location)
                    .font(.system(size: 22))
                    .italic()
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "person.fill")
                Text("\(lobby.currentMembers.count)/\(lobby.maxMembers)")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
            }
        }
    }
    
    private var lobbyMembers: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 28) {
                ForEach(lobby.currentMembers, id: \.self) { profile in // TODO: network integration
                    membersScrollViewCell(profile)
                }
            }
            .padding(24)
            .background(color1)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
    
    private func membersScrollViewCell(_ profile: Profile) -> some View {
        HStack (spacing: 12) {
            Image(systemName: "applelogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
            
            Text("\(profile.firstname) \(profile.lastname)")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.black)
            
            Spacer()
        }
    }
    
//    private var joinLobbyButton: some View {
//        Button {
//            
//        } label: {
//            Text("Join Lobby")
//                .font(.title2)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .foregroundStyle(.white)
//                .padding(16)
//                .background(color2)
//                .clipShape(RoundedRectangle(cornerRadius: 16))
//        }
//    }
}

#Preview {
    LobbyMemberView(lobby: lobbies[0]) // TODO: remove this
}
