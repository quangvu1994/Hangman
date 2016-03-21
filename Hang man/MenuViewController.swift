//
//  ViewController.swift
//  Hang man
//
//  Created by Quang on 2/4/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBAction func getNationWord(sender: AnyObject) {
        let category = Category()
        let word = category.getRandomWord("Nation")
        var stringLength = word!.characters.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

