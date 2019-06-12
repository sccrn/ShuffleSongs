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
    private var musics: [MusicModel] = []
    
    ///We're calling our Manager to fetch the musics.
    //First we're shuffled our bands's ID to get news bands.
    //Then we're getting 3 elements of band's array and converting to string to our request.
    //And finally, we're handling the response.
    func loadMusics() {
        let bandsShuffled = bandsID.shuffled()
        let ids = bandsShuffled.randomPick(number: 3).joined(separator: ",")
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
    
    ///We're removing the element that contains only the band's info and we don't this.
    private func filterMusics(result: [Music]) -> [MusicModel] {
        return shuffleBands(result: result.filter { $0.artworkUrl != nil })
    }
    
    ///We're converting the Music to our MusicModel to send to our tableview.
    private func shuffleBands(result: [Music]) -> [MusicModel] {
        var array: [MusicModel] = []
        result.forEach {
            array.append(MusicModel(music: $0))
        }
        return array
    }

}

extension HomeViewModel {
    func numberOfRows() -> Int { return musics.count }
    
    func typeOfMusic(for row: Int) -> MusicModel {
        return musics[row]
    }
}
