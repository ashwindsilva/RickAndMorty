//
//  CharacterImageTableViewCell.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 19/02/24.
//

import Combine
import UIKit

class CharacterImageTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier: String = "CharacterImageTableViewCell"
    
    private var viewModel: CharacterImageTableViewCellViewModel?
    private var subscriptions: Set<AnyCancellable> = .init()
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    // MARK: - Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(characterImageView)
        
        NSLayoutConstraint.activate([
               characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
               characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               characterImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor)
           ])
    }
    
    func configure(with viewModel: CharacterImageTableViewCellViewModel) {
        viewModel.$imageData
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] data in
                self?.characterImageView.image = data != nil ? UIImage(data: data!) : nil
            }
            .store(in: &subscriptions)

        viewModel.getImageData()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        subscriptions.removeAll()
    }
}
