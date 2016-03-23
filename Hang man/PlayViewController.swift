//
//  PlayViewController.swift
//  Hang man
//
//  Created by Quang on 3/23/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

class PlayViewController : UIViewController, UITextFieldDelegate{
    let limitLength = 1
    var missGuessCounter = 0
    
    @IBOutlet weak var resultWord: UILabel!
    @IBOutlet weak var guessWord: UITextField?
    
    @IBAction func guessAction(sender: AnyObject) {
        if guessWord?.text != ""{
            if word!.lowercaseString.characters.contains(Character((guessWord?.text?.lowercaseString)!)){
                print(word!)
            }else{
                print("Wrong")
                missGuessCounter += 1
            }
        }else{
            print("Please guess a letter")
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        guessWord?.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text
            else {
                return true
        }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }

}