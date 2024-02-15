//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 07/02/24.
//

import Combine
import UIKit

final class CharacterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "CharacterCollectionViewCell"
    
    private var viewModel: CharacterViewModel?
    private var subscriptions: Set<AnyCancellable> = .init()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
    private var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
        label.text = "Sample text"
        
        return label
    }()
    
    // MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 10
        clipsToBounds = true
        
        constructHierarchy()
        activateConstraints()
    }
    
    private func constructHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(overlayView)
        contentView.addSubview(label)
    }
    
    private func activateConstraints() {
        activateImageViewConstraints()
        activateOverlayViewConstraints()
        activateLabelConstraints()
    }
    
    private func activateImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    private func activateOverlayViewConstraints() {
        NSLayoutConstraint.activate([
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    private func activateLabelConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 8)
        ])
    }
    
    func configure(with viewModel: CharacterViewModel) {
        self.viewModel = viewModel
        self.label.text = viewModel.name
        
        self.viewModel?.$imageData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                guard let self, let data, self.viewModel == viewModel else {
                    return
                }
                
                self.imageView.image = UIImage(data: data)
            }
            .store(in: &subscriptions)
        
        self.viewModel?.getImageData()
    }
}
