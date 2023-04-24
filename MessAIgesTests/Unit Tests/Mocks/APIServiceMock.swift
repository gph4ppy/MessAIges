//
//  APIServiceMock.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 24/04/2023.
//

@testable import MessAIges

final class APIServiceMock: APIService {
    override func sendMessage(text: String, completion: @escaping (String) -> Void) async {
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            completion(text + " failure")
        } else {
            completion(text + " success")
        }
    }
}
