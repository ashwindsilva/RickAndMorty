//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 16/02/24.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    // MARK: - Properties
    
    private let viewModel: CharacterDetailViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailView(viewModel: viewModel)
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    private func configureUI() {
        title = viewModel.name
    }
}
