//
//  HomeViewModel.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

enum HomeState {
    case success
    case failure(err: Error)
}

protocol HomeDelegate: class {
    func didFinish(with state: HomeState)
}

class HomeViewModel {
    weak var delegate: HomeDelegate?
    private var bandsID: [String] = BandID.allCases.map { $0.rawValue }
    private var musics: [Music] = []
    
    func loadMusics() {
        let ids = bandsID[randomPick: 3]
        MusicManager().fetchMusics(by: ids) { (result) in
            switch result {
            case .success(let movieResponse):
                self.musics = self.filterMusics(result: movieResponse.results)
                self.delegate?.didFinish(with: .success)
            case .failure(let error):
                self.delegate?.didFinish(with: .failure(err: error))
            }
        }
    }
    
    private func filterMusics(result: [Music]) -> [Music] {
        return result.filter { $0.artworkUrl != nil }
    }
}

extension HomeViewModel {
    func numberOfRows() -> Int { return musics.count }
    
    func typeOfMusic(for row: Int) -> MusicModel {
        return MusicModel(music: musics[row])
    }
}
