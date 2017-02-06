//
//  ViewController.swift
//  Task3
//
//  Created by Sierra 4 on 03/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btnFacebook: UIButton!
    
    @IBOutlet weak var btnEmail: UIButton!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Circular buttons
        //let btnHeight = self.btnEmail.frame.size.height
        btnRegister.backgroundColor = .clear
        btnFacebook.layer.cornerRadius = 30
        btnEmail.layer.cornerRadius = 30
        btnRegister.layer.cornerRadius = 30
        btnRegister.layer.borderWidth = 2
        btnRegister.layer.borderColor = UIColor.white.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fbEmail = "sandeep.kumar@facebook.com"
        if segue.identifier == "segueDirectFromFBButton" {
            let destinationViewController: ViewControllerProfileSetup = segue.destination as! ViewControllerProfileSetup
            destinationViewController.secondInremediateEmail = fbEmail
        }
        
    }
    
}

