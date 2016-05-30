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
* For each action, it simply send the category selection to the PlayViewController class
*/

class CategoryViewController : UIViewController{
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let playViewCategory: PlayViewController = segue.destinationViewController as! PlayViewController
        if segue.identifier == "technology" {
            playViewCategory.categorySelection = "technology"
        }else if segue.identifier == "people" {
            playViewCategory.categorySelection = "people"
        }else if segue.identifier == "science" {
            playViewCategory.categorySelection = "science"
        }else if segue.identifier == "animal" {
            playViewCategory.categorySelection = "animal"
        }else if segue.identifier == "city" {
            playViewCategory.categorySelection = "city"
        }else {
            playViewCategory.categorySelection = "sport"
        }
    }
}
