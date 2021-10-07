//
//  Network.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import Foundation
import Combine

// MARK: - Error -

enum NetworkError: Error {
    case decoding
    case code(Int)
}

// MARK: - Service -

struct NetworkService {
    
    // MARK: - Private
    
    private static let apiKey = "05ab9f175ff645d69ca7eb4f936317dd"
    private static let baseUrl = "https://newsapi.org"
    
    // MARK: - Public
    
    /// Fetches the list of all "headline" articles.
    /// - Returns: A publisher of type `AnyPublisher<Response<Article>, NetworkError>`.
    static func getArticles() -> AnyPublisher<Response<Article>, NetworkError> {
        guard let url = URL(string: "\(baseUrl)/v2/top-headlines?country=us&apiKey=\(apiKey)") else {
            return Fail(error: NetworkError.code(-1)).eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .mapError { _ in NetworkError.code(-2) }
            .receive(on: DispatchQueue.main)
            .flatMap { (data, response) -> AnyPublisher<Response<Article>, NetworkError> in
                guard
                    let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode)
                else {
                    return Fail(error: NetworkError.code((response as! HTTPURLResponse).statusCode)).eraseToAnyPublisher()
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                return Just(data)
                    .decode(type: Response<Article>.self, decoder: decoder)
                    .mapError{ _ in NetworkError.decoding }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    
}
