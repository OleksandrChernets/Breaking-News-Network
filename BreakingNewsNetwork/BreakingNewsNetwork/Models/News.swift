//
//  News.swift
//  BreakingNewsNetwork
//
//  Created by Oleksandr Chernets on 11.03.2023.
//

import Foundation


struct News: Decodable {
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL?
    let publishedAt: Date
    let content: String?
}

struct NewsEvelope {
    let status: String
    let totalResults: Int
    let articles: [News]
}
