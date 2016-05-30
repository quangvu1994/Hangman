//
//  Category.swift
//  Hang man
//
//  Created by Quang on 3/21/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

/**
* The Category class provides a set of different categories.
*/
class Category {
    
    var word: String?
    var categoryName: String?
    var description: String?
    
    // Catogeries of word and its description
    var animal: [Int: (name: String, clue: String)]! = [
        1 : ("Tiger", "Big kitty"),
        2 : ("Lion", "King of the jungle"),
        3 : ("Dog", "A true loyal friend"),
        4 : ("Cat", "Soft and cute, but probably doesn't care about you"),
        5 : ("Shark", "Blood seeker of the sea")
    ]
    
    var technology: [Int: (name: String, clue: String)]! = [
        1 : ("Browser", "Google Chrome, Safari, Internet Explorer, Fire Fox, etc"),
        2 : ("Computer", "Biggest evolution of teachnology"),
        3 : ("Internet", "Thing that the teenager cannot live without"),
        4 : ("Operating System", "A Software that manages all the activities of a computer"),
        5 : ("Bluetooth", "Short range wireless interconnection of different devices")
    ]
    var science: [Int: (name: String, clue: String)]! = [
        1 : ("Big Bang", "How did the universe start... 'scientifically' theory?"),
        2 : ("Gravity", "How did the apple fall on Newton's head?"),
        3 : ("Quantum", "The smallest discrete unit of any physical property"),
        4 : ("Particle", "A minute fragment of matter"),
        5 : ("Galaxy", "Huge system contains lots of stars and dark matters")
    ]
    var people : [Int: (name: String, clue: String)]! = [
        1 : ("Snoozy", "Beautiful, yet snore. Lovely, yet clumsy"),
        2 : ("Einstein", "Genius guy invented bunch of energy and gravitational theories "),
        3 : ("Tesla", "Inventor of the alternating current (AC)"),
        4 : ("Obama", "Thank you ..."),
        5 : ("Newton", "Apple loves this guy's head")
    ]
    var city : [Int: (name: String, clue: String)]! = [
        1 : ("Hanoi", "Best place to try the best Vietnamese dish, Pho"),
        2 : ("London", "The big smoke city in England"),
        3 : ("Barcelona", "Rivary of Real Madrid"),
        4 : ("Tokyo" , "Capital of the sushi country"),
        5 : ("New York", "The city that never sleeps")
    ]
    var sport : [Int: (name: String, clue: String)]! = [
        1 : ("Soccer", "Play with your feet, and kick the ball to the back of the net"),
        2 : ("Tennis", "Best known from the Wimbledon competition"),
        3 : ("Hiking", "Climb the mountain"),
        4 : ("Football", "Bunch of monstrous athletes chase after the ball and throw it around the field"),
        5 : ("Sky diving", "You jump out of a plane!")
    ]
    
    /**
    * The function pick the selected category and grab a random word
    * from it. Then, it initializes the word and description
    *
    * @param: categoryName - name of the desired category
    * @return: None
    */
    func getRandomWord(categoryName: String){
        var category = Dictionary<Int, (name: String, clue: String)>()
        
        switch categoryName.lowercaseString {
        case "sport":
            category = sport
            self.categoryName = "Sport"
        case "city":
            category = city
            self.categoryName = "City"
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
        
        // Selecting a random word
        let randomNum = Int(arc4random_uniform(4) + 1)
        self.word = category[randomNum]!.name
        self.description = category[randomNum]!.clue
    }
}

