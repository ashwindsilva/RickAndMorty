//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 19/02/24.
//

import Combine
import UIKit

class CharacterDetailView: UIView {
    
    // MARK: - Propterties
    
    private let viewModel: CharacterDetailViewModel
    private let rowCellReuseIdentifier: String = "rowCellReuseIdentifier"
    private var subscriptions: Set<AnyCancellable> = .init()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Methods
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupUI()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        
        tableView.register(CharacterImageTableViewCell.self, forCellReuseIdentifier: CharacterImageTableViewCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: rowCellReuseIdentifier)
    }
    
    private func contentConfiguration(for cell: UITableViewCell, with detailRow: DetailRow) -> UIListContentConfiguration? {
        var config = cell.defaultContentConfiguration()
        config.text = detailRow.label
        config.secondaryText = detailRow.value
        config.prefersSideBySideTextAndSecondaryText = true
        config.secondaryTextProperties.font = .preferredFont(forTextStyle: .body)
        config.secondaryTextProperties.color = .secondaryLabel
        
        return config
    }
}

extension CharacterDetailView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.section(at: indexPath)
        
        switch section {
        case .appearance:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterImageTableViewCell.reuseIdentifier) as? CharacterImageTableViewCell else {
                fatalError("Failed to dequeue CharacterImageTableViewCell")
            }
            cell.configure(with: viewModel.characterImageViewModel)
            return cell
        case .info(let rowDetails), .location(let rowDetails):
            let cell = tableView.dequeueReusableCell(withIdentifier: rowCellReuseIdentifier, for: indexPath)
            cell.contentConfiguration = contentConfiguration(for: cell, with: rowDetails[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.title(forHeaderIn: section)
    }
}
