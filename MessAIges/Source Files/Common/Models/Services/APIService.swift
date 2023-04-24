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

class APIService: APIServiceProtocol {
    /// A property storing a GPT client used for performing api calls.
    var client: ChatGPTAPI?

    /// An API service used for performing GPT actions.
    init() {
        setupClient()
    }

    /// This method set ups the client based on the API token.
    func setupClient() {
        guard let token = Bundle.main.infoDictionary?["GPT_API_KEY"] as? String else { return }
        client = ChatGPTAPI(apiKey: token)
    }

    /// This method sends a provided text to the GPT and performs some action with the received response.
    /// - Parameters:
    ///   - text: A string value which will be sent to GPT, based on which the response is created.
    ///   - completion: An action performed after receiving a response.
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
            // TODO: Error Handling
            dump(error.localizedDescription)
        }
    }
}
