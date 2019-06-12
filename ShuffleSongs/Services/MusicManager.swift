//
//  MusicManager.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

///This class is our Manager, we have all methods for our music's object.
class MusicManager {
    ///We're creating our url with our ids and the limit of music for each band.
    public func fetchMusics(by ids: String, result: @escaping (Result<Response, SSError>) -> Void) {
        let baseURL = "\(Constants.baseURL)\(ids)\(Constants.limit)"
        guard let url = URL(string: baseURL) else { return }
        APIManager().fetchResources(url: url, completion: result)
    }
}
