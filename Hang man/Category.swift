//
//  Category.swift
//  Hang man
//
//  Created by Quang on 3/21/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

class Category {
    var word: String?
    var categoryName: String?
    // Catogeries of words
    var animal: [Int : String]! = [
        1 : "Tiger",
        2 : "Lion",
        3 : "Dog",
        4 : "Cat",
        5 : "Shark"
    ]
    
    var technology: [Int : String]! = [
        1 : "Browser",
        2 : "Computer",
        3 : "Internet",
        4 : "Operating System",
        5 : "Bluetooth"
    ]
    var science: [Int : String]! = [
        1 : "Big Bang",
        2 : "Gravity",
        3 : "Quantum",
        4 : "Particle",
        5 : "Galaxy"
    ]
    var people : [Int :String]! = [
        1 : "Snoozy",
        2 : "Gravity",
        3 : "Quantum",
        4 : "Particle",
        5 : "Galaxy"
    ]
    var nation : [Int : String]! = [
        1 : "Vietnam",
        2 : "England",
        3 : "Spain",
        4 : "Russia",
        5 : "Australia"
    ]
    var sport : [Int : String]! = [
        1 : "Soccer",
        2 : "Tennis",
        3 : "Hiking",
        4 : "Snowboarding",
        5 : "Sky diving"
    ]
    
    
    func getRandomWord(categoryName: String){
        var category = Dictionary<Int, String>()
        switch categoryName.lowercaseString {
        case "sport":
            category = sport
            self.categoryName = "Sport"
        case "nation":
            category = nation
            self.categoryName = "Nation"
        case "people":
            category = people
            self.categoryName = "People"
        case "science":
            category = science
            self.categoryName = "Science"
        case "technology":
            category = technology
            self.categoryName = "Technology"
        case "animal":
            category = animal
            self.categoryName = "Animal"
        default:
            self.word = nil
        }
        
        let randomNum = Int(arc4random_uniform(4) + 1)
        self.word = category[randomNum]
    }
}

let category = Category()
