//
//  MusicTests.swift
//  ShuffleSongsTests
//
//  Created by Guarana on 2019-06-12.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import XCTest
@testable import ShuffleSongs

class MusicTests: XCTestCase {
    var music: Music!
    var musicModel: MusicModel!

    override func setUp() {
        super.setUp()
        music = Music(id: 587787, artworkUrl: "https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fjohn-dollar-antihero.png?alt=media&token=68b89bd6-87c4-4122-9998-dbd33f75f90c", trackName: "Something", artistId: 766678, artistName: "Band 1")
        musicModel = MusicModel(music: music)
    }

    override func tearDown() {
        super.tearDown()
        music = nil
        musicModel = nil
    }

    func testLoadImageFromURL() {
        let image = musicModel.loadImage(urlString: music.artworkUrl)
        let notImage = musicModel.loadImage(urlString: "")
        let nilImage = musicModel.loadImage(urlString: nil)
        XCTAssertNotNil(image)
        XCTAssertNil(notImage)
        XCTAssertNil(nilImage)
    }

    func testRequest() {
        let homeViewModel = HomeViewModel()
        
        XCTAssertNotNil(homeViewModel.loadMusics())
        XCTAssertEqual(homeViewModel.numberOfRows(), 0)
    }
}
