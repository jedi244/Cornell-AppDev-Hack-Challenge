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
    let currentPeople: Int
    let description: String
}

var lobbies = [
    Lobby(course: "CS 2110", location: "Duffield Atrium", maxPeople: 5, currentPeople: 2, description: ""),
    Lobby(course: "KOREA 1101", location: "RBG Lounge", maxPeople: 8, currentPeople: 1, description: ""),
    Lobby(course: "CS 1998-601", location: "Gates Hall", maxPeople: 2, currentPeople: 2, description: "")
]
