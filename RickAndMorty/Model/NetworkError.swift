//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(String)
    case requestFailed(String)
    case decodingError(String)
}
