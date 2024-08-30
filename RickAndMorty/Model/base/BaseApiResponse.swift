//
//  BaseApiResponse.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

struct BaseApiResponse<T: Codable>: Codable {
    
    let info: Info
    let results: [T]
    
    struct Info: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }
}
