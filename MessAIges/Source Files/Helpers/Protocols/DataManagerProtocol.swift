//
//  DataManagerProtocol.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import Foundation

protocol DataManager {
    func fetch<Object>() -> [Object]
    func save<Object>(object: Object)
    func remove<Object>(object: Object)
}
