//
//  CategoryViewController.swift
//  Hang man
//
//  Created by Quang on 3/23/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

var word : String?

class CategoryViewController : UIViewController{
    let category = Category()
    
    @IBAction func technologyCategory(sender: AnyObject) {
        word = category.getRandomWord("Technology")!
    }
    @IBAction func sportCategory(sender: AnyObject) {
        word = category.getRandomWord("Sport")!
    }
    @IBAction func peopleCategory(sender: AnyObject) {
        word = category.getRandomWord("People")!
    }
    @IBAction func scienceCategory(sender: AnyObject) {
        word = category.getRandomWord("Science")!
    }
    @IBAction func animalCategory(sender: AnyObject) {
        word = category.getRandomWord("Animal")!
    }
    @IBAction func nationCategory(sender: AnyObject) {
        word = category.getRandomWord("Nation")!
    }
}
