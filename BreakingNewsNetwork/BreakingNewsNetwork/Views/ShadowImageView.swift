//
//  ShadowImageView.swift
//  BreakingNewsNetwork
//
//  Created by Alexandr Chernets on 12.03.2023.
//

import UIKit

class ShadowImageView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        return v
    }()
    
    private lazy var baseView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 5, height: 5)
        v.layer.shadowOpacity = 0.7
        v.layer.shadowRadius = 10.0
        return v
    }()
    
    
}
