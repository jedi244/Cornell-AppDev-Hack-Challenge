//
//  CreateLobbyView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/29/23.
//

import SwiftUI

struct CreateLobbyView: View {
    
    // MARK: Properties
    @Environment(\.dismiss) var dismiss
    @State private var course: String = ""
    @State private var location: String = ""
    @State private var maxMembers: Int = 1
    @State private var description: String = ""
    
    let color1 = Color(red: 0.894, green: 0.91, blue: 0.937)
    let color2 = Color(red: 0.051, green: 0.439, blue: 0.761)
    let color3 = Color(red: 0.596, green: 0.769, blue: 0.906)
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            VStack {
                lobbyDetails
            }
            .navigationTitle("Create lobby")
            .toolbarBackground(color3, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(color1)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(24)
                
            createLobbyButton
        }
    }
    
    // MARK: Views
    private var lobbyDetails: some View {
        Group {
            HStack {
                Text("Course:")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer(minLength: 20)
                
                TextField("Add course", text: $course)
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .padding(16)
                    .frame(width: 200, height: 36)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack {
                Text("Location:")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer(minLength: 20)
                
                TextField("Add location", text: $location)
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .padding(16)
                    .frame(width: 180, height: 36)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.top, -36)
            
            HStack {
                Text("Max people:")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer(minLength: 20)
                
                Picker("", selection: $maxMembers, content: {
                    ForEach(1..<51, content: { i in
                        Text(String(i))
                    })
                })
                .padding(16)
                .frame(width: 150, height: 36)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.top, -36)
            
            HStack {
                Text("Description (Optional):")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            .padding(.top, -36)
            
            HStack {
                TextField("Description", text: $description, axis: .vertical)
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .padding(16)
                    .frame(height: 200)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.top, -48)
                
        }
        .padding(24)
    }
    
    private var createLobbyButton: some View {
        Button {
            createLobby()
        } label: {
            Text("Create Lobby")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .padding(16)
                .background(color2)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

    // MARK: Helper functions
    func createLobby() {
        let lobby = Lobby(course: self.course, location: self.location, maxMembers: self.maxMembers, currentMembers: [], description: self.description)
        
        lobbies.append(lobby) // TODO: network integration
        
        self.course = ""
        self.location = ""
        self.maxMembers = 1
        self.description = ""
        
        dismiss()
    }
}

#Preview {
    CreateLobbyView()
}
