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
    var correctGuessCounter = 0
    
    @IBOutlet weak var resultWord: UILabel!
    @IBOutlet weak var guessWord: UITextField?
    @IBOutlet weak var head: UIImageView!
    @IBOutlet weak var body: UIImageView!
    @IBOutlet weak var leftLeg: UIImageView!
    @IBOutlet weak var leftArm: UIImageView!
    @IBOutlet weak var rightArm: UIImageView!
    @IBOutlet weak var rightLeg: UIImageView!
    var imageIndex = 0
    var arrayImage : [UIImageView]?

    @IBAction func guessAction(sender: AnyObject) {
        if guessWord?.text != ""{
            if word!.lowercaseString.characters.contains(Character((guessWord?.text?.lowercaseString)!)){
                for i in 0...word!.characters.count{
                    if word!.lowercaseString[word!.startIndex.advancedBy(i)] == Character(guessWord!.text!.lowercaseString) {
                        resultWord!.text!.removeAtIndex(resultWord!.text!.startIndex.advancedBy(i))
                        resultWord!.text!.insert(word![word!.startIndex.advancedBy(i)], atIndex: resultWord!.text!.startIndex.advancedBy(i))
                        correctGuessCounter += 1
                        
                        if correctGuessCounter == word!.characters.count{
                            let alert = UIAlertController(title: "Yay, that is correct!", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                            alert.addAction(UIAlertAction(title: "Next Word", style: UIAlertActionStyle.Default, handler: nil))
                            self.presentViewController(alert, animated: true, completion: nil)
                            correctGuessCounter = 0
                        }
                        break
                    }
                }
            }else{
                print("Wrong")
                missGuessCounter += 1
                UIView.animateWithDuration(2, animations:{
                    self.arrayImage![self.imageIndex].alpha = 1
                    self.imageIndex += 1
                })
                if missGuessCounter == 6 {
                    let alert = UIAlertController(title: "Oops, incorrect!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    for i in Range(0...5){
                        self.arrayImage![i].alpha = 0
                    }
                    self.imageIndex = 0
                    self.missGuessCounter = 0
                    
                }
            }
        }else{
            let alert = UIAlertController(title: "Please guess a letter", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    /**
    * Dismiss the keyboard when the user hit return/done button
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    /**
    * Dismiss the keyboard when the user tap anywhere else
    */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        arrayImage = [head, body, leftLeg, leftArm, rightArm, rightLeg]
        guessWord?.delegate = self
        for _ in 0..<word!.characters.count{
            resultWord?.text?.append("_" as Character)
        }
        print(word!)
    }
    
    /**
    * Limit the number of characters to one for the guessing text field
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