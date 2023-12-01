//
//  Post.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 12/1/23.
//

import Foundation

struct Post: Hashable, Codable {
    let id: String
    let user: Profile
    let message: String
    let time: Date
}

var posts = [
    Post(id: "1", user: profiles[0], message: "HelloHelloHelloHelloHelloHelloHelloHelloHelloHello", time: Date()),
    Post(id: "2", user: profiles[1], message: "HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello", time: Date())
]
