//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
}

final class RMCharacterListViewViewModel: NSObject {
    public weak var delegate: RMCharacterListViewViewModelDelegate?
    private var characterList: [RMCharacterModel] = [] {
        didSet {
            for character in characterList {
                let viewModel = RMCharacterCellViewModel(characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
        }
    }
    private var cellViewModels = [RMCharacterCellViewModel]()

    func fetchAllCharacters() {
        RMService.shared.makeRequest(.listAllCharactersRequest, expecting: RMCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                let results = model.results
                print(results)
                self?.characterList = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }

            case .failure(let error):
                print("Error Fetching Data: \(error.localizedDescription)")
            }
        }    
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else { fatalError("Unsupported Cell") }

        let viewModel = cellViewModels[indexPath.row]
        cell.configureCell(with: viewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        let height = width * 1.4 //Relative to the height of the screen

        return CGSize(
            width: width,
            height: height)
    }
}
