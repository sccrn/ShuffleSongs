//
//  APIManager.swift
//  ShuffleSongs
//
//  Created by Samanta Coutinho on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

///This is our enum with all of bands's ID for our request.
enum BandID: String, CaseIterable {
    case johnDollar = "909253"
    case charlieAndTheChewie = "1171421960"
    case blocoToti = "358714030"
    case mcArianne = "1419227"
    case decimaisMC = "264111789"
    
}

class APIManager {
    private var baseURL = Constants.baseURL
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
    ///This is our function to request an URL in our project.
    ///Using URLSession we're doing an async call and with a Codable
    ///for the specific method. For this method be async, we're using
    ///the DispatchQueue, to update our UI. Particularly, I don't use URLSession usually.
    ///Normally, I use Alamofire with Codable.
    func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, SSError>) -> Void) {
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
            case .failure: completion(.failure(.noData))
            }
        }.resume()
    }
}

///This extension is to request the URL asynchronously. 
extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
