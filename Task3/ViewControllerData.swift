//
//  ViewControllerData.swift
//  Task3
//
//  Created by Sierra 4 on 03/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ViewControllerData: UIViewController {
    
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblDOB: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    var lblOutputFirstName = String()
    var lblOutputLastName = String()
    var lblOutputDOB = String()
    var lblOutputEmail = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigation bar
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 50))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "Data Parsed");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(ViewControllerSignUp.backButtonMethod));
        navItem.leftBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: false);
        navBar.tintColor = UIColor.darkGray
        navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
        
        lblFirstName.text = lblOutputFirstName
        lblLastName.text = lblOutputLastName
        lblDOB.text = lblOutputDOB
        lblEmail.text = lblOutputEmail
        
    }
    
    func backButtonMethod(){
        _ = navigationController?.popViewController(animated: true)
    }

}
