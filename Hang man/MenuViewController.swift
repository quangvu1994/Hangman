//
//  ViewController.swift
//  Hang man
//
//  Created by Quang on 2/4/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var resultWord: UITextField!
    @IBOutlet weak var guessWord: UITextField!
    
    @IBAction func guessButton(sender: AnyObject) {
        
    }
    @IBAction func getNationWord(sender: AnyObject) {
        let category = Category()
        let word = category.getRandomWord("Nation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text!.characters.count > maxLength) {
            textField.deleteBackward()
        }
    }
    
}

