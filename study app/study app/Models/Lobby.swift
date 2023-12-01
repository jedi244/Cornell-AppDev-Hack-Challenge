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
    let maxMembers: Int
    let currentMembers: [Profile]
    let description: String
}

var lobbies = [
    Lobby(course: "CS 2110", location: "Duffield Atrium", maxMembers: 5, currentMembers: [profiles[0], profiles[1]], description: ""),
    Lobby(course: "KOREA 1101", location: "RBG Lounge", maxMembers: 8, currentMembers: [profiles[2]], description: ""),
    Lobby(course: "CS 1998-601", location: "Gates Hall", maxMembers: 2, currentMembers: [profiles[2], profiles[3]], description: "")
]
