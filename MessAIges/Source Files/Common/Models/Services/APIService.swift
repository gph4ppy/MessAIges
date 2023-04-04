//
//  APIService.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 04/04/2023.
//

import ChatGPTSwift
import Foundation

protocol APIServiceProtocol {
    var client: ChatGPTAPI? { get }
    func setupClient()
    func sendMessage(text: String, completion: @escaping (_ response: String) -> Void) async
}

final class APIService: APIServiceProtocol {
    var client: ChatGPTAPI?

    init() {
        setupClient()
    }

    func setupClient() {
        guard let token = Bundle.main.infoDictionary?["GPT_API_KEY"] as? String else { return }
        client = ChatGPTAPI(apiKey: token)
    }

    func sendMessage(text: String, completion: @escaping (_ response: String) -> Void) async {
        do {
            guard
                let response = try await client?.sendMessage(text: text),
                !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            else { return }

            DispatchQueue.main.async {
                completion(response)
            }
        } catch {
            dump(error.localizedDescription)
            // TODO: Error Handling
        }
    }
}
