//
//  HeroViewModel.swift
//  OverwatchHeros
//
//  Created by Thomas Garayua on 7/11/23.
//

import Foundation

class HeroViewModel: ObservableObject {
    @Published var heros: [Hero] = []
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            fatalError("Couldn't find data.json in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            heros = try decoder.decode([Hero].self, from: data)
        } catch {
            fatalError("Couldn't parse data:\n\(error.localizedDescription)")
        }
    }
}
