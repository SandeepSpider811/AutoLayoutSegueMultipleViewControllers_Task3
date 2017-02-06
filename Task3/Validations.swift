//
//  Validations.swift
//  Task3
//
//  Created by Sierra 4 on 06/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class Validations {
    //Email
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    //only alphabets
    func validateString(value: String) -> Bool {
        let STRING_REGEX = "^[a-zA-Z]+$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", STRING_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    //alert controller
    func alertMessage(messageString: String, _ selfArg: UIViewController) {
        let alert = UIAlertController(title: "Oops!", message: messageString, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in print("you have pressed the Cancel button")
        }))
        selfArg.present(alert, animated: true, completion: nil)
    }
}
