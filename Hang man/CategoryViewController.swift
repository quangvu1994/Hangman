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
    
    @IBAction func getNationWord(sender: AnyObject) {
        word = category.getRandomWord("Nation")!
        for _ in 0...word!.characters.count{
            // resultWord?.text?.append("_" as Character)
        }
        print(word)
    }
    
}
