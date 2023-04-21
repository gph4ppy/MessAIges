//
//  DataManagerProtocol.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import Foundation

protocol DataManager {
    /// This method fetches all the saved objects of provided type from local storage.
    func fetch<Object>() -> [Object]
    /// This method saves the provided object of some type to local storage.
    /// - Parameter object: An object meant to be saved.
    func save<Object>(object: Object)
    /// This method removes the provided object of some type from local storage.
    /// - Parameter object: An object meant to be removed.
    func remove<Object>(object: Object)
}
