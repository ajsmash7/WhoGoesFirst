//
//  ViewController.swift
//  WhoGoesFirst
//
//  Created by AJMac on 2/12/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//declare outlets for the winner, teamOne, team two, and the button label
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var teamOne: UITextField!
    @IBOutlet var teamTwo: UITextField!
    @IBOutlet var buttonLabel: UIButton!
    
    var isTeamOne: String?
    var isTeamTwo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //I could not get the app to work with enabling and disabling the button.
        //buttonLabel.isUserInteractionEnabled = false   // this is not the same thing as enabled/disabled - the button will still be clickable but the events from it will be ignored.
        buttonLabel.setTitle("Enter Both Team Names", for: .disabled)
        buttonLabel.isEnabled = false
    }
    
    @IBAction func teamOneEditingChanged(_ textField: UITextField){
        if let text = textField.text, !text.isEmpty{
            isTeamOne = textField.text
        }
        shouldEnableButton()
    }
    
    
    @IBAction func teamTwoEditingChanged(_ textField: UITextField){
        if let text = textField.text, !text.isEmpty{
            isTeamTwo = textField.text
        }
        shouldEnableButton()
    }
    
    // this could possibly have a better name 
    func shouldEnableButton() {
        print("enable \(isTeamOne) \(isTeamTwo)")
        if let t1 = teamOne.text, let t2 = teamTwo.text {
            if t1.count > 0 && t2.count > 0 {
                buttonLabel.isEnabled = true
            } else {
                buttonLabel.isEnabled = false
            }
        }
    }
    //I originally had isTeamOne, isTeamTwo set as bool vars, but could not get button enable/disable to work
    //func buttonEnabled(){
        //if isTeamOne,isTeamTwo {
            //buttonLabel.setTitle("Select Random Team", for: .normal)
            //buttonLabel.isUserInteractionEnabled = true
        //}else{
            //buttonLabel.setTitle("Enter Both Team Names", for: .disabled)
        //}
    //}
    
 //enable the button action. Since the button will be disabled until both text fields are filled, there is no validation.
    // a random number is generated. Since this is Xcode 4 and not 4.2, arc4random is required, with a range of 0 to n-1, so 2.
    // Int wrapper, if then to determine which team is displayed
    
    @IBAction func showWhoGoesFirst(_ sender: UIButton){
        let randomNumber = Int(arc4random_uniform(2))
        if randomNumber == 0 {
            winnerLabel.text = teamOne.text
        }else {
            winnerLabel.text = teamTwo.text
        }
    }
    //action to disable keyboard when tapped outside of the textfield. 
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        teamOne.resignFirstResponder()
        teamTwo.resignFirstResponder()
    }
    

}

