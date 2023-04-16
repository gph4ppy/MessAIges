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

    init(
        apiService: APIServiceProtocol = APIService(),
        historyManager: HistoryManagerProtocol = HistoryManager()
    ) {
        self.apiService = apiService
        self.historyManager = historyManager
    }
}
