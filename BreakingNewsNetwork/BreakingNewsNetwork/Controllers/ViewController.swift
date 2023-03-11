//
//  ViewController.swift
//  BreakingNewsNetwork
//
//  Created by Oleksandr Chernets on 11.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        
        NetworkManager.shared.getNews { (news) in
            guard let news = news else { return }
            print(news[0].title)
        }
    }


}

