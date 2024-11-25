//
//  UserModel.swift
//  Github-Users
//
//  Created by Edson Brandon on 25/11/24.
//

import Foundation

struct GithubUser: Codable {
    var login : String
    var bio : String
    var avatarUrl: String
}
