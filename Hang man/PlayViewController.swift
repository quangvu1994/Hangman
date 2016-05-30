//
//  PlayViewController.swift
//  Hang man
//
//  Created by Quang on 3/23/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

/**
* PlayViewController provides all logical behind every action in the
* play scene.
*/
class PlayViewController : UIViewController, UITextFieldDelegate{
    
    var categorySelection: String = ""
    var category = Category()
    let limitLength = 1
    var missGuessCounter = 0
    var correctGuessCounter = 0
    var characterAlreadyGuess: [String] = []
    
    @IBOutlet weak var descriptionLabel: UILabel!
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

    @IBAction func guessAction(sender: AnyObject?) {
        if guessWord?.text != ""{
            // User's guess is correct
            if category.word!.lowercaseString.characters.contains(Character((guessWord?.text?.lowercaseString)!)) && !characterAlreadyGuess.contains(guessWord!.text!){
                for i in 0..<category.word!.characters.count{
                    // Display the character at the correct position
                    if category.word!.lowercaseString[category.word!.startIndex.advancedBy(i)] == Character(guessWord!.text!.lowercaseString) {
                        resultWord!.text!.removeAtIndex(resultWord!.text!.startIndex.advancedBy(i))
                        resultWord!.text!.insert(category.word![category.word!.startIndex.advancedBy(i)], atIndex: resultWord!.text!.startIndex.advancedBy(i))
                        correctGuessCounter += 1
                    }
                }
                self.characterAlreadyGuess.append(guessWord!.text!)
                
                // Win the game
                if correctGuessCounter == category.word!.characters.count{
                    let alert = UIAlertController(title: "Yay, that is correct!", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                    alert.addAction(UIAlertAction(title: "Next Word!", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                        self.category.getRandomWord(self.category.categoryName!)
                        self.descriptionLabel.text = self.category.description!
                        self.resultWord!.text! = ""
                        for _ in 0..<self.category.word!.characters.count{
                            self.resultWord?.text?.append("_" as Character)
                        }
                        // Hide all hangman's images
                        for i in Range(0...5){
                            self.arrayImage![i].alpha = 0
                        }
                        // Reset variables for a new game
                        self.missGuessCounter = 0
                        self.imageIndex = 0
                        self.correctGuessCounter = 0
                        self.characterAlreadyGuess = []
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            // User's guess is wrong
            }else{
                missGuessCounter += 1
                UIView.animateWithDuration(2, animations:{
                    self.arrayImage![self.imageIndex].alpha = 1
                    self.imageIndex += 1
                })
                if missGuessCounter == 6 {
                    let alert = UIAlertController(title: "Oops, incorrect!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    for i in 0...5{
                        self.arrayImage![i].alpha = 0
                    }
                    
                    self.resultWord!.text! = ""
                    for _ in 0..<category.word!.characters.count{
                        self.resultWord?.text?.append("_" as Character)
                    }
                    self.imageIndex = 0
                    self.missGuessCounter = 0
                    self.correctGuessCounter = 0
                    self.characterAlreadyGuess = []
                    
                }
            }
        // Handle a scenario when the user doesn't put any input
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
        guessAction(nil)
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
        self.category.getRandomWord(categorySelection)
        arrayImage = [head, body, leftLeg, leftArm, rightArm, rightLeg]
        guessWord?.delegate = self
        
        for _ in 0..<category.word!.characters.count{
            self.resultWord?.text?.append("_" as Character)
        }
        
        self.descriptionLabel.lineBreakMode = .ByWordWrapping
        self.descriptionLabel.numberOfLines = 3
        self.descriptionLabel.sizeToFit()
        self.descriptionLabel.text = category.description!
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