//
//  ViewControllerSignUp.swift
//  Task3
//
//  Created by Sierra 4 on 03/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ViewControllerSignUp: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    var email = ""
    
    var validationObject = Validations()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Navigations bar
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 50))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "Sign Up");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(ViewControllerSignUp.backButtonMethod));
        navItem.leftBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: false);
        navBar.tintColor = UIColor.darkGray
        navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
 
        txtFieldEmail.delegate = self
        txtFieldPassword.delegate = self
    }
    //back button
    func backButtonMethod(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.txtFieldEmail {
            textField.returnKeyType = UIReturnKeyType.next
        } else {
            textField.returnKeyType = UIReturnKeyType.default
        }
        return true
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.txtFieldEmail {
            self.txtFieldPassword.becomeFirstResponder()
        } else if textField == self.txtFieldPassword {
            self.view.endEditing(true)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Validations on click on Next button
    @IBAction func btnNextSignUpScreen(_ sender: Any) {
        if !validationObject.isValidEmail(testStr: txtFieldEmail.text!) {
            validationObject.alertMessage(messageString: "Please enter correct email address.", self)
        } else if txtFieldPassword.text == "" {
            validationObject.alertMessage(messageString: "Please enter a password.", self)
        } else {
            performSegue(withIdentifier: "segueLogIn", sender: self)
        }
    }
    //sending email to another screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        email = txtFieldEmail.text!
        let destinationViewController: ViewControllerLogIn = segue.destination as! ViewControllerLogIn
        destinationViewController.intermediateEmail = email
    }
}
