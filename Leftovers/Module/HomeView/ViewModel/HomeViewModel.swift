//
//  HomeViewModel.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 30/10/2023.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var tags: [String] = []
    @Published var recipes: [Recipe] = []
    
    // MARK: Mock - remove later
    let tagsArray = ["All", "Indian", "Italian", "Asian", "Chines", "Polish", "Fast Food"]
    let imgFoodArray = ["food_1, food_2"]
    let recipesArray = [Recipe(id: 1,
                               title: "Classic Greak Salad",
                               time: 15,
                               image: "food_1",
                               rating: 4.5),
                        Recipe(id: 2,
                               title: "Crunchy Nut Coleslaw",
                               time: 10,
                               image: "food_2",
                               rating: 3.5)]
    
    let newRecipe = [Recipe(id: 3,
                            title: "Steak with tomato",
                            time: 20,
                            image: "food_card",
                           rating: 5,
                           profileImage: "profile_img",
                           author: "James Milner"),
                     Recipe(id: 4,
                            title: "Pilaf sweet",
                            time: 15,
                            image: "food_card",
                            rating: 4,
                            profileImage: "profile_img",
                            author: "Marcus Rashford")]
    
    @Published var isSelectedTag: String = ""
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    
    init() {
        self.populateTagsArray()
        self.populateRecipeArray()
    }
    
    
    func populateTagsArray() {
        tags.append(contentsOf: tagsArray)
    }
    
    func populateRecipeArray() {
        recipes.append(contentsOf: recipesArray)
    }
}
