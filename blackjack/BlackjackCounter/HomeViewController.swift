//
//  HomeViewController.swift
//  BlackjackCounter
//
//  Created by React-Native on 09/10/2018.
//  Copyright © 2018 TeamSebAlex. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var decksTextfied: UITextField!
    @IBOutlet weak var buttonUI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decksTextfied.keyboardType = .numberPad
        buttonUI.isEnabled = false
        buttonUI.setTitle("Need amount of decks", for: .disabled)
        buttonUI.setTitle("Accept", for: .normal)
        buttonUI.backgroundColor = UIColor.lightGray
        buttonUI.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func ActionButton() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            homeViewController.text = decksTextfied.text!
            present(homeViewController, animated: false)
        }
    }
    @IBAction func endEditing() {
        if decksTextfied.text?.isEmpty == false {
            buttonUI.isEnabled = true
            buttonUI.backgroundColor = UIColor.black
        } else {
            buttonUI.isEnabled = false
            buttonUI.backgroundColor = UIColor.lightGray
        }
    }
    @objc func dismissKeyboard() {
        decksTextfied.resignFirstResponder()
    }
}
