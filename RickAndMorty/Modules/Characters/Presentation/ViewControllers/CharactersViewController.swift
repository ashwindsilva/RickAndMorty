//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import Combine
import UIKit

protocol CharactersViewControllerDelegate: AnyObject, CharactersViewDelegate {
}

class CharactersViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: CharactersViewModel
    private var subscriptions: Set<AnyCancellable> = .init()
    
    weak var delegate: CharactersViewControllerDelegate?

    // MARK: - Lifecycle
    
    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let mainView = CharactersView(viewModel: viewModel)
        mainView.delegate = delegate
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewState()
    }
    
    // MARK: - Methods
    
    private func observeViewState() {
        viewModel.$viewState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.setNeedsUpdateContentUnavailableConfiguration()
            }
            .store(in: &subscriptions)
    }
    
    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
        switch viewModel.viewState {
        case .loading:
            contentUnavailableConfiguration = loadingContentUnavailableConfiguration()
        case .empty:
            contentUnavailableConfiguration = emptyContentUnavailableConfiguration()
        case .loaded:
            contentUnavailableConfiguration = nil
        }
    }
    
    private func loadingContentUnavailableConfiguration() -> UIContentUnavailableConfiguration {
        var config = UIContentUnavailableConfiguration.loading()
        config.text = LocalizedStrings.loadingCharacters.capitalized
        return config
    }
    
    private func emptyContentUnavailableConfiguration() -> UIContentUnavailableConfiguration {
        var config = UIContentUnavailableConfiguration.empty()
        config.image = UIImage(systemName: Tab.characters.imageName)
        config.text = LocalizedStrings.noCharacters.capitalized
        return config
    }
}
