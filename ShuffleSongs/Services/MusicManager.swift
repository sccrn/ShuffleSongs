//
//  MusicManager.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

class MusicManager {
    public static let shared = MusicManager()
    private let urlSession = URLSession.shared

    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
    public func fetchMusics(by ids: [String], result: @escaping (Result<Response, SSError>) -> Void) {
        let allIds = ids.joined(separator: ",")
        var base = Constants.baseURL
        base.append(allIds)
        base.append(Constants.limit)
        let baseURL = URL(string: base)
        guard let url = baseURL else { return }
        fetchResources(url: url, completion: result)
    }
    

    private func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, SSError>) -> Void) {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.unknown))
            return
        }
        guard let url = urlComponents.url else {
            completion(.failure(.apiError))
            return
        }
        
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                       completion(.success(values))
                    }
                    
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure:
                completion(.failure(.noData))
            }
            }.resume()
    }
}
