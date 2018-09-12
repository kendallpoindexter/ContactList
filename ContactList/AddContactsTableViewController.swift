//
//  AddContactsTableViewController.swift
//  ContactList
//
//  Created by Kendall Poindexter on 9/10/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

protocol AddContactsTableViewControllerDelegate: class {
    
    func addContactsTableViewControllerDidCancel( _ controller: AddContactsTableViewController)
    
    func addContactsTableViewController(_ controller: AddContactsTableViewController, didFinishAdding contact: Contact)
}

class AddContactsTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    weak var delegate: AddContactsTableViewControllerDelegate?
    
    //MARK: - Outlets
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneNumberInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return  nil
    }
    
    //MARK: - Methods
    
   
    
    //MARK: - Actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.addContactsTableViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        guard let first = firstNameInput.text,
            let last = lastNameInput.text,
            let phone = phoneNumberInput.text else {
            return
        }
        let contact = Contact(firstName: first, lastName: last, phoneNumber: phone)
        delegate?.addContactsTableViewController(self, didFinishAdding: contact)

        
    }
    

}
