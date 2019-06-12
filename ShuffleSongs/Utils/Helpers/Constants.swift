//
//  Constants.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

///All of app's strings
struct Constants {
    static let initError = "init(coder:) has not been implemented"
    static let homeScreen = "Shuffle Songs"
    
    static let baseURL = "https://us-central1-tw-exercicio-mobile.cloudfunctions.net/lookup?id="
    static let limit = "&limit=5"
    
    static let ok = "Ok!"
    static let ops = "Ops!"
    static let apiError = "Something went wrong in your request."
    static let invalidResponse = "Your response is invalid. :("
    static let noData = "There's no data in your response."
    static let decodeError = "Something went wrong in your decode."
    static let unknown = "Something went wrong. :("
}
