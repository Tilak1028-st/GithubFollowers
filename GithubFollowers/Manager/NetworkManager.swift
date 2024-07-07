//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 06/07/24.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for userName: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {
        let endPoint = baseURL + "\(userName)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completion(.failure(.inValidUserName))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.inValidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.inValidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.inValidData))
            }
        }
        
        task.resume()
    }
    
    func getUserInfo(for userName: String, completion: @escaping (Result<User, GFError>) -> Void) {
        let endPoint = baseURL + "\(userName)"
        
        guard let url = URL(string: endPoint) else {
            completion(.failure(.inValidUserName))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.inValidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.inValidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.inValidData))
            }
        }
        
        task.resume()
    }
}
