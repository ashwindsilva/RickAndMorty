//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

class CharactersViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: CharactersViewModel

    // MARK: - Lifecycle
    
    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = CharactersView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
