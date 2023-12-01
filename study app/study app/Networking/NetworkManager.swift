//
//  NetworkManager.swift
//  study app
//
//  Created by Jedi Lertviwatkul on 12/1/23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    /// Shared singleton instance
    static let shared = NetworkManager()
    
    private init() { }
    
    // MARK: Properties
    
    private var endpoint = "https://chatdev-wuzwgwv35a-ue.a.run.app/api/posts/"
    private let decoder = JSONDecoder()
    
    // MARK: - Requests
    func getPosts(completion: @escaping ([Post]) -> Void) {
        
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Post].self, decoder: decoder) { response in
                switch response.result {
                case .success(let posts):
                    completion(posts)
                case .failure(let error):
                    print("Error in NetworkManager.getPosts: \(error.localizedDescription)")
                    completion([])
                }
            }
    }
    
    func postNew(message: String, completion: @escaping (Bool) -> Void ) {
        
        decoder.dateDecodingStrategy = .iso8601
        
        let parameters: Parameters = [
            "message": message
        ]
        
        AF.request("\(endpoint)create/", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder) { response in
            
                switch response.result {
                case .success(let post):
                    print("Post created successfully")
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.postNew: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }
}
