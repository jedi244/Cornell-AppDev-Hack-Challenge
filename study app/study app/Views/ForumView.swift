//
//  ForumView.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 12/1/23.
//

import SwiftUI

struct ForumView: View {
    
    // MARK: Properties
    @State var myPosts: [Post] = posts
    
    // Create Date Formatter
    let dateFormatter = DateFormatter()
    
    let color1 = Color(red: 0.894, green: 0.910, blue: 0.937)
    let color2 = Color(red: 0.051, green: 0.439, blue: 0.761)
    let color3 = Color(red: 0.596, green: 0.769, blue: 0.906)
    
    // MARK: Body
    var body: some View {
        HStack{
            scrollView
        }
    }
    
    // MARK: Views
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
                ForEach(myPosts, id: \.self) { post in // TODO: network integration
                    forumScrollViewCell(post)
                }
                .padding(16)
                .background(color1)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding(24)
        .padding(.top, -8)
    }
    
    private func forumScrollViewCell(_ post: Post) -> some View {
        VStack (alignment: .leading) {
            HStack {
                    Image(systemName: "applelogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                    
                    VStack (alignment: .leading) {
                        Text("\(post.user.firstname) \(post.user.lastname)")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                        
                        Text(convertTime(time: post.time))
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                            .italic()
                    }
                
                Spacer()
            }
            Text("\(post.message)")
                .font(.body)
                .fontWeight(.medium)
                .foregroundStyle(.black)
        }
        .padding(12)
    }
    
    private func convertTime(time: Date) -> String {
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short

        return dateFormatter.string(from: time)
    }
}

#Preview {
    ForumView()
}
