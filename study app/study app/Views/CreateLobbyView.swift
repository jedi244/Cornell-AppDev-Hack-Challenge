//
//  CreateLobbyView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/29/23.
//

import SwiftUI

struct CreateLobbyView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Course")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                //TextField(
            }
        }
    }
    
//    private var setupView: some View {
//        NavigationStack {
//            HStack {
//                Spacer()
//                
//                NavigationLink {
//                    Text("Hello")
//                } label: {
//                    HStack (spacing: 4) {
//                        Text("New lobby")
//                            .font(.system(size: 18))
//                            .fontWeight(.bold)
//                            .foregroundStyle(.black)
//                        Image(systemName: "plus")
//                            .foregroundStyle(.black)
//                    }
//                }
//                .frame(width: 150, height: 32)
//                .background(Color(white: 0.90))
//                .clipShape(RoundedRectangle(cornerRadius: 16))
//                .padding(.top, 24)
//                .padding(.trailing, 24)
//            }
//            
//            scrollView
//                .navigationTitle("Lobbies")
//                .toolbarBackground(Color(red: 0.596, green: 0.769, blue: 0.906), for: .navigationBar)
//                .toolbarBackground(.visible, for: .navigationBar)
//        }
//    }
    
//    private var view: some View {
//        
//    }
}

#Preview {
    CreateLobbyView()
}
