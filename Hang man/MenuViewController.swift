//
//  ViewController.swift
//  Hang man
//
//  Created by Quang on 2/4/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITextFieldDelegate {
    var word: String = ""
    let limitLength = 1
    
    @IBOutlet weak var resultWord: UITextField!
    @IBOutlet weak var guessWord: UITextField?

    @IBAction func getNationWord(sender: AnyObject) {
        let category = Category()
        word = category.getRandomWord("Nation")!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guessWord?.delegate = self
    }
    
    /**
     Limit the UITextField length to one -> User can only guess one letter at a time
     */
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text
            else {
                return true
            }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
}

