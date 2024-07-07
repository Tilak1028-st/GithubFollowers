//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 06/07/24.
//

import Foundation

enum GFError: String, Error {
    case inValidUserName  = "This username created an invalid request. Please try again!"
    case unableToComplete = "Unable to complete your request. Please check your internet connection!"
    case inValidResponse  = "Invalid response from the server. Please try again!"
    case inValidData      = "The Data received from the server was invalid. Please try again!"
    case unableToFavorite = "There was an error favoriting this user. Please try again"
    case alreadInFavorites = "You've already favorited this user. You must REALLY LIKE them!"
}
