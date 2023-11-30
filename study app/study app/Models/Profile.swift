//
//  Profile.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 11/29/23.
//

import Foundation

struct Profile: Hashable {
    let imageName: String
    let firstname: String
    let lastname: String
}

var profiles = [
    Profile(imageName: "", firstname: "Ashlie", lastname: "Zhang"),
    Profile(imageName: "", firstname: "Jedi", lastname: "Lertviwatkul"),
    Profile(imageName: "", firstname: "Joshua", lastname: "Yeung"),
    Profile(imageName: "", firstname: "Arnav", lastname: "Kaul")
]
