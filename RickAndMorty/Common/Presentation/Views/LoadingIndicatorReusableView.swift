//
//  LoadingIndicatorReusableView.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 11/02/24.
//

import UIKit

final class LoadingIndicatorReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let reuseIdentifier: String = "LoadingIndicatorReusableView"
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: topAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        activityIndicator.startAnimating()
    }
}
