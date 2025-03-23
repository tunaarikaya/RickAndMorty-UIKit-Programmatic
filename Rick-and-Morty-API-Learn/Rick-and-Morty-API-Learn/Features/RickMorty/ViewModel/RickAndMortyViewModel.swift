// RickAndMortyViewModel.swift
// Rick-and-Morty-API-Learn
//
// Created by Mehmet Tuna Arıkaya on 23.03.2025.
//

import Foundation
import UIKit

protocol IRickAndMortyViewModel {
    func fetchItems()
    func changeLoading()

    var rickMortyCharacters: [Result] { get set }
    var rickMortyService: IRickAndMortyService { get }
}

class RickAndMortyViewModel: IRickAndMortyViewModel {
    var rickMortyCharacters: [Result] = []
    var isLoading = false 
    var rickMortyService: IRickAndMortyService = RickAndMortyService()

    // fetchItems metodunu güncelledik
    func fetchItems() {
        rickMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickMortyCharacters = response ?? []
        }
    }

    // changeLoading metodunu implement ettik
    func changeLoading() {
        print("Loading state changed")
    }
}
