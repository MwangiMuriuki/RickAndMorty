//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import UIKit

/// Single Cell for a Character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        setupConstraints()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints(){

        NSLayoutConstraint.activate([
            //From Bottom to Top
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),

            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor),


            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3)


        ])

    }

    func configureCell(with viewModel: RMCharacterCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.charcterStatusText

        viewModel.fetchImage {[weak self] result in
            switch result {
            case .success(let fetchedData):
                DispatchQueue.main.async {
                    let image = UIImage(data: fetchedData)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print("Error Downloading Image: \(error)")
            }

        }

    }

}
