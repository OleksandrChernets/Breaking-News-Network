//
//  NetworkManager.swift
//  BreakingNewsNetwork
//
//  Created by Oleksandr Chernets on 11.03.2023.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    private init () {}
    
    // MARK: Constans
    private let baseUrl = "https://newsapi.org/v2/"
    private let UATopHeadline = "top-headlines?country=us"
    
    // MARK: getNewsRequest
    func getNews(completion: @escaping ([News]?) -> Void) {
        let urlString = "\(baseUrl)\(UATopHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else {return}
        
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
    
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(nil)
                    print("nil")
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
