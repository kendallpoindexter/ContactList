//
//  ContactsTableViewController.swift
//  ContactList
//
//  Created by Kendall Poindexter on 9/10/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
 
    //MARK: - Properties
    
    var contactList = ContactList()
    var selectedContactIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.arrayOfContacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contacts", for: indexPath)
        let name1 = contactList.arrayOfContacts[indexPath.row].firstName
        let name2 = contactList.arrayOfContacts[indexPath.row].lastName
        
        cell.textLabel?.text = "\(name1) \(name2)"
        // Configure the cell...

        return cell
    }
    
    //MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactSegue" {
            guard let addContactTableViewController = segue.destination as? AddContactsTableViewController else { return }
            addContactTableViewController.delegate = self
        } else if segue.identifier == "contactDetailsSegue" {
            guard let contactDetailsViewController = segue.destination as? ContactDetailsViewController else {return}
            
            contactDetailsViewController.contact = contactList.arrayOfContacts[selectedContactIndex]
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedContactIndex = indexPath.row
        return indexPath
    }
}


//MARK: - Delegate Protocols

extension ContactsTableViewController: AddContactsTableViewControllerDelegate {
    
    func addContactsTableViewControllerDidCancel(_ controller: AddContactsTableViewController) {
        navigationController?.popViewController(animated: true)

    }
    
    func addContactsTableViewController(_ controller: AddContactsTableViewController, didFinishAdding contact: Contact) {
        let newRowIndex = contactList.arrayOfContacts.count
        contactList.arrayOfContacts.append(contact)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
}
