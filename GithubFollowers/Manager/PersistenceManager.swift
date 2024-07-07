//
//  PersistenceManager.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 07/07/24.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completion: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    
                    guard !retrievedFavorites.contains(favorite) else {
                        completion(.alreadInFavorites)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll(where: { $0.login == favorite.login })
                }
                completion(save(favorites: retrievedFavorites))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    static func retrieveFavorites(completion: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([]))
            return
        }
        
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completion(.success(favorites))
        } catch {
            completion(.failure(.inValidData))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
        } catch {
            return .unableToFavorite
        }
        return nil
    }
}
