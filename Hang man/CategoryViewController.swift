//
//  CategoryViewController.swift
//  Hang man
//
//  Created by Quang on 3/23/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

/**
* CategoryViewController provides the logical behind each 
* button on the category scene. 
* For each action, it simply grabs a random word from the 
* category.  
*/

class CategoryViewController : UIViewController{
    
    @IBAction func technologyCategory(sender: AnyObject) {
        category.getRandomWord("Technology")
    }
    @IBAction func sportCategory(sender: AnyObject) {
        category.getRandomWord("Sport")
    }
    @IBAction func peopleCategory(sender: AnyObject) {
        category.getRandomWord("People")
    }
    @IBAction func scienceCategory(sender: AnyObject) {
        category.getRandomWord("Science")
    }
    @IBAction func animalCategory(sender: AnyObject) {
        category.getRandomWord("Animal")
    }
    @IBAction func nationCategory(sender: AnyObject) {
        category.getRandomWord("City")
    }

}
