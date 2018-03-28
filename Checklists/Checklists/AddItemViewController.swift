//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Fernanda Araújo on 28/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        print("Contents of the text field: \(textField.text!)")

        navigationController?.popViewController(animated: true)
    }
}
