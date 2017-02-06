//
//  ViewControllerProfileSetup.swift
//  Task3
//
//  Created by Sierra 4 on 03/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ViewControllerProfileSetup: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtFieldFirstName: UITextField!
   
    @IBOutlet weak var txtFieldLastName: UITextField!
    
    @IBOutlet weak var txtFieldDOB: UITextField!
    
    let datePicker = UIDatePicker()
    
    var currentDate = Date()
    var validationObject = Validations()
    
    //current date changed to string
    var currentDateString: String = ""
    
    var firstName = ""
    var lastName = ""
    var dOB = ""
    var secondInremediateEmail = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigation bar
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 50))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "Profile Setup");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(ViewControllerSignUp.backButtonMethod));
        navItem.leftBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: false);
        navBar.tintColor = UIColor.darkGray
        navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
        
        txtFieldFirstName.delegate = self
        txtFieldLastName.delegate = self
        txtFieldDOB.delegate = self
        
        //date picker function call
        createDatePicker()
        
        //current date format
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        currentDateString = dateFormatter.string(from: currentDate)
        print(currentDateString)
    }
    
    func backButtonMethod(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == UIReturnKeyType.default {
            textField.returnKeyType = UIReturnKeyType.next
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.txtFieldFirstName {
            self.txtFieldLastName.becomeFirstResponder()
        } else if textField == self.txtFieldLastName{
            self.txtFieldDOB.becomeFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func createDatePicker() {
        
        //format for picker
        datePicker.datePickerMode = .date
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        txtFieldDOB.inputAccessoryView = toolbar
        
        //assigning datePicker to textfield
        txtFieldDOB.inputView = datePicker
    }
    
    //done button above date picker click method
    func donePressed() {
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        txtFieldDOB.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    //validations check before click on Next button
    @IBAction func btnNextProfil(_ sender: Any) {
        if txtFieldFirstName.text == "" || !validationObject.validateString(value: txtFieldFirstName.text!) {
            validationObject.alertMessage(messageString: "Please enter first name.", self)
        } else if txtFieldLastName.text == "" || !validationObject.validateString(value: txtFieldLastName.text!) {
            validationObject.alertMessage(messageString: "Please enter last name.", self)
        } else if txtFieldDOB.text == currentDateString || txtFieldDOB.text == "" {
            validationObject.alertMessage(messageString: "Please enter a valid DOB", self)
        } else {
             performSegue(withIdentifier: "segueData", sender: self)
        }
    }
    //sending data to print on another viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        firstName = txtFieldFirstName.text!
        lastName = txtFieldLastName.text!
        dOB = txtFieldDOB.text!
        let destinationViewController: ViewControllerData = segue.destination as! ViewControllerData
        destinationViewController.lblOutputFirstName = txtFieldFirstName.text!
        destinationViewController.lblOutputLastName = txtFieldLastName.text!
        destinationViewController.lblOutputDOB = txtFieldDOB.text!
        destinationViewController.lblOutputEmail = secondInremediateEmail
    }
}
