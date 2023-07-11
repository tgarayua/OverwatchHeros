//
//  ContentView.swift
//  OverwatchHeros
//
//  Created by Thomas Garayua on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HeroViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.heros, id: \.key) { hero in
                AsyncImage(url: URL(string: hero.portrait))
                    .frame(width: 200, height: 200)
                    .padding()
                VStack(alignment: .leading) {
                    
                    Text("Name: \(hero.name)")
                        .font(.title)
                    Text("Role: \(hero.role)")
                        .foregroundColor(.secondary)
                }
                .navigationTitle("Overwatch Heros")
            }
        }
        .padding()
        .onAppear{
            viewModel.loadData()
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
