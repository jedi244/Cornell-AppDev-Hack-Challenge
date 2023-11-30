//
//  Lobby.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/29/23.
//

import Foundation

struct Lobby: Hashable {
    let course: String
    let location: String
    let maxPeople: Int
    let currentPeople: [String]
    let description: String
}

var lobbies = [
    Lobby(course: "CS 2110", location: "Duffield Atrium", maxPeople: 5, currentPeople: ["Ashlie Zhang", "Jedi Lertviwatkul"], description: ""),
    Lobby(course: "KOREA 1101", location: "RBG Lounge", maxPeople: 8, currentPeople: ["Joshua Yeung"], description: ""),
    Lobby(course: "CS 1998-601", location: "Gates Hall", maxPeople: 2, currentPeople: ["Joshua Yeung", "Arnav Kaul"], description: "")
]
