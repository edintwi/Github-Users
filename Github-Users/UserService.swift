//
//  UserService.swift
//  Github-Users
//
//  Created by Edson Brandon on 25/11/24.
//

import Foundation

class UserService {
    public static let shared = UserService()
    
    public func getUser() async throws -> GithubUser {
        let endpoint = "https://api.github.com/users/edintwi"
        
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
