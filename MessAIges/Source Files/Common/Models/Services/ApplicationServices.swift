//
//  ApplicationServices.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 04/04/2023.
//

import Foundation

protocol ApplicationServicesProtocol {
    var apiService: APIServiceProtocol { get }
}

final class ApplicationServices: ApplicationServicesProtocol {
    static let shared = ApplicationServices()
    var apiService: APIServiceProtocol
    var historyManager: HistoryManagerProtocol

    /// An object containing all the services used across the application.
    /// - Parameters:
    ///   - apiService: An API service used for performing GPT actions.
    ///   - historyManager: A history manager used for managing the local storage.
    init(
        apiService: APIServiceProtocol = APIService(),
        historyManager: HistoryManagerProtocol = HistoryManager()
    ) {
        self.apiService = apiService
        self.historyManager = historyManager
    }
}
