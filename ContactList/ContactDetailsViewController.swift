//
//  ContactDetailsViewController.swift
//  ContactList
//
//  Created by Kendall Poindexter on 9/11/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    
    //MARK: - Properties
    var contact: Contact?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contact = contact else {return}
        populateDetailView(data: contact)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Methods
    
    func populateDetailView(data: Contact) {
        firstNameLabel.text = data.firstName
        lastNameLabel.text = data.lastName
        phoneNumberLabel.text = data.phoneNumber
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
