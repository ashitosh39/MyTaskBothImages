//
//  Product.swift
//  MyTaskBothImages
//
//  Created by Macintosh on 20/05/24.
//

import Foundation
struct Product: Codable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let images: [String]
    let creationAt, updatedAt: String
    let category: Category
}


struct Category: Codable {
    let id: Int
    let name: String
    let image: String
//    let creationAt, updatedAt: At?
}

//enum At: String, Codable {
//    case the20240520T033651000Z = "2024-05-20T03:36:51.000Z"
//}

enum Name: String, Codable {
    case clothes = "Clothes"
    case electronics = "Electronics"
    case furniture = "Furniture"
    case miscellaneous = "Miscellaneous"
    case shoes = "Shoes"
}

typealias Welcome = [Product]
