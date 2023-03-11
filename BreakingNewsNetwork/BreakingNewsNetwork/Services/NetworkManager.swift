//
//  NetworkManager.swift
//  BreakingNewsNetwork
//
//  Created by Alexandr Chernets on 11.03.2023.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    private init () {}
    
    // MARK: Constans
    private let baseUrl = "https://newsapi.org/v2/"
    private let UATopHeadline = "top-headlines?country=ua"
    
    // MARK: getNewsRequest
    func getNews(completion: @escaping ([News]?) -> Void) {
        let url = "\(baseUrl)\(UATopHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                completion(nil)
                print("nil")
                return
                
            }
            let newEnvelope = try? JSONDecoder().decode(NewsEvelope.self, from: data)
            newEnvelope == nil ? completion(nil) : completion(newEnvelope?.articles)
        }.resume()
    }
}
