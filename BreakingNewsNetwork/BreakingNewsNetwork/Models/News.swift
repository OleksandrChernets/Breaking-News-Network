//
//  News.swift
//  BreakingNewsNetwork
//
//  Created by Oleksandr Chernets on 11.03.2023.
//

import Foundation

struct NewsEvelope: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct News: Decodable {
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL?
    let content: String?
}


