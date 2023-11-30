//
//  JoinLobbyView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/29/23.
//

import SwiftUI

struct JoinLobbyView: View {
    
    private var course: String = "CS 2110"
    private var location: String = "Duffield Atrium"
    private var maxPeople: Int = 1
    private var currentPeople: [String] = ["You"]
    private var description: String = "Notes on Djikstra's"
    
    let color1 = Color(red: 0.894, green: 0.91, blue: 0.937)
    let color2 = Color(red: 0.051, green: 0.439, blue: 0.761)
    let color3 = Color(red: 0.596, green: 0.769, blue: 0.906)
    
    var body: some View {
        NavigationStack {
            VStack {
                lobbyDetails
                
                lobbyMembers
            }
            .navigationTitle("Join lobby")
            .toolbarBackground(color3, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(24)
            
            // TODO: Doesn't return to the lobbies view
            NavigationLink {
                LobbyView()
            } label: {
                joinLobbyButton
            }
        }
    }
    
    private var lobbyDetails: some View {
        
        VStack (alignment: .leading, spacing: 12) {
            
            Text(course)
                .font(.title)
                .fontWeight(.bold)
            
            Text(description)
                .font(.title2)
                .fontWeight(.light)
                .foregroundStyle(.gray)
            
            HStack {
                Image(systemName: "location.fill")
                Text(location)
                    .font(.system(size: 22))
                    .italic()
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "person.fill")
                Text("\(currentPeople.count)/\(maxPeople)")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
            }
        }
    }
    
    private var lobbyMembers: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 28) {
                ForEach(profiles, id: \.self) { profile in // TODO: network integration
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
    
    private var joinLobbyButton: some View {
        Button {
            
        } label: {
            Text("Join Lobby")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .padding(16)
                .background(color2)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

}

#Preview {
    JoinLobbyView()
}
